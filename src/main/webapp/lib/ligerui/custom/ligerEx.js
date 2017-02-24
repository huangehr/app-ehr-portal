/**
 * ligerUI 扩展组件
 */
(function ($, win) {

    /******************** 条件选取控件 ***********************/
        //add by hzp at 20160223
    $.fn.ligerCondition = function ()
    {
        return $.ligerui.run.call(this, "ligerCondition", arguments);
    };

    $.ligerDefaults.Condition = {
        nameField:"code",
        textField:"text",
        typeField:"type",
        dictField:"dict",
        disabled: false,
        readonly: false,
        andOrData:[{code:" AND ",value:"并且"},{code:" OR ",value:"或者"}],
        stringTypeData:[{code:" = ",value:"等于"},{code:" LIKE ",value:"模糊匹配"},{code:" IN ",value:"包含"},{code:" NOT IN ",value:"不包含"}],
        numberTypeData:[{code:" = ",value:"等于"},{code:" <> ",value:"不等于"},{code:" > ",value:"大于"},{code:" >= ",value:"大于等于"},{code:" < ",value:"小于"},{code:" <= ",value:"小于等于"}],
        dateTypeData:[{code:" = ",value:"等于"},{code:" <> ",value:"不等于"},{code:" > ",value:"大于"},{code:" >= ",value:"大于等于"},{code:" < ",value:"小于"},{code:" <= ",value:"小于等于"}],
        fields:[], //条件字段
        value:'',
        stdDictUrl:'', //字典数据
        stdDictVersion:'',//字典版本号
        isMoveLeft:true,//默认第二条件开始左移
        index:0,
        andOrControlFlag:"and_or",
        fieldControlFlag:"field",
        conditionControlFlag:"condition",
        valueControlFlag:"value"
    };

    $.ligerMethos.Condition = {};

    $.ligerui.controls.Condition = function (element, options)
    {
        $.ligerui.controls.Condition.base.constructor.call(this, element, options);
    };

    $.ligerui.controls.Condition.ligerExtend($.ligerui.controls.Input,
        {
            _getType: function ()
            {
                return 'Condition';
            },
            _extendMethods: function ()
            {
                return $.ligerMethos.Condition;
            },
            _init: function () {
                $.ligerui.controls.Condition.base._init.call(this);
            },
            _render: function ()
            {
                var me = this, p = this.options;
                me.inputValue = null;
                me.inputControl = null;
                me.value = null;
                me.textFieldID = "";
                if (this.element.tagName.toLowerCase() == "input" && this.element.type)
                {
                    if(this.element.type == "text")
                    {
                        $(this.element).attr("type","hidden");
                    }
                    me.inputValue = $(this.element);
                    if (this.element.id)
                        me.textFieldID = this.element.id;
                }

                if (me.textFieldID == "" && p.textFieldID)
                    me.textFieldID = p.textFieldID;

                me.addButton = $('<div class="l-button l-button-green" style="clear:both;margin-left:0px;" id="'+me.textFieldID+'_add_btn"><span>添加条件</span></div>');
                me.content = $("<div id='"+me.textFieldID+"_content' class='m-form-condition'></div>");
                me.inputValue.after(me.addButton).after(me.content);


                /*if (p.disabled)
                 {
                 me.inputValue.parent().addClass("l-text-disabled");
                 }*/
                //初始化值
                me.addButton.click(function () {
                    me.newItem();
                });
                if(p.value!=undefined && p.value.length >0)
                {
                    me.setValue(p.value);
                }
                else{
                    me.newItem();
                }
            },
            //设置字段
            setFields:function(fields){
                var me =this;
                var option = me.options;
                option.fields = fields;
                me.setValue("");
            },
            //设置字典参数
            setDictParms:function(parms){
                var me =this;
                var option = me.options;
                option.stdDictParms = parms;
            },
            //赋值
            setValue:function(data){
                try{
                    var me = this;
                    me.content.find("div.m-form-group").remove();

                    if(data!=null && data.length>0 && data!="[]")
                    {
                        //判断是否字符串
                        if(typeof(data)=="string")
                        {
                            data = eval(data);
                        }

                        for(var i=0;i<data.length;i++)
                        {
                            me.newItem(data[i].andOr,data[i].field,data[i].condition,data[i].value);
                        }
                    }
                    else{
                        me.newItem();
                    }
                }
                catch(e)
                {

                }

            },
            //取值
            getValue:function(){
                var me = this;
                var option = me.options;
                var re = '';
                $.each(me.content.find("div.m-form-group"),function(index,item){
                    var o = '{';
                    var groupId = this.id;
                    var andOrControlId = groupId+"_"+option.andOrControlFlag;
                    var fieldControlId = groupId+"_"+option.fieldControlFlag;
                    var conditionControlId =groupId+"_"+option.conditionControlFlag;
                    var valueControlId =groupId+"_"+option.valueControlFlag;

                    var andOr = " AND ";
                    if(index!=0) {
                        andOr = $("#"+andOrControlId).ligerComboBox("getValue");
                    }
                    var field = $("#"+fieldControlId).ligerComboBox("getValue");
                    var condition = $("#"+conditionControlId).ligerComboBox("getValue");
                    debugger
                    var value = $("#"+valueControlId).val();
                    var type = $("#"+valueControlId+"_div").attr("controlType");
                    var selFieldData = $("#"+fieldControlId).ligerComboBox("getSelected");
                    var fieldType = "";
                    if(type == "combobox")
                    {
                        value = $("#"+valueControlId).ligerComboBox("getValue");
                    }
                    else if(type == "mult_combobox" || type =="mult_textbox"){
                        value = $("#"+valueControlId).ligerMultbox("getValue");
                    }

                    if(selFieldData && selFieldData.type){
                        fieldType = selFieldData.type;
                    }

                    if(andOr.length>0 && field.length>0 && condition.length>0 && value.length>0)
                    {
                        o+='andOr:"'+andOr+'",';
                        o+='field:"'+field+'",';
                        o+='type:"' + fieldType + '",';
                        o+='condition:"'+condition+'",';
                        o+='value:"'+value+'"';
                        o+='}';

                        if(re.length>0)
                        {
                            re += ","+o;
                        }
                        else{
                            re = o;
                        }
                    }
                });

                return '['+re+']';
            },
            //创建元素
            newItem:function(andOr,field,condition,value){
                var me = this;
                var option = me.options;
                var index = option.index;
                var groupId = me.textFieldID+"_"+index;
                var andOrControlId = groupId+"_"+option.andOrControlFlag;
                var fieldControlId = groupId+"_"+option.fieldControlFlag;
                var conditionControlId =groupId+"_"+option.conditionControlFlag;
                var valueControlId = groupId+"_"+option.valueControlFlag;
                var html = '<div class="m-form-group" id="'+groupId+'">';
                if(me.content.find("div.m-form-group").length >0)
                {
                    if(option.isMoveLeft)
                    {
                        html = '<div class="m-form-group m-form-move-left" id="'+groupId+'">';
                    }
                    html += '<div class="m-form-control"><input type="text" id="'+andOrControlId+'" data-type="select"/></div>';
                }

                html += '<div class="m-form-control"><input type="text" id="'+fieldControlId+'" data-type="select"/></div>';
                html += '<div class="m-form-control"><input type="text" id="'+conditionControlId+'" data-type="select"/></div>';
                html += '<div class="m-form-control" controlType="textbox" id="'+valueControlId+'_div" style="margin-left:0px;"><input type="text" id="'+valueControlId+'"  class="l-textbox"/></div>';

                if(index >0)
                {
                    html += '<div class="m-form-control"><a class="m-btn-cancle" href="javascrip:void()" style="display:block;" onclick="$(\'#'+groupId+'\').remove()"></a></div>';
                }

                html += '</div>';
                me.content.append(html);


                if(index!=0)
                {
                    $("#"+andOrControlId).ligerComboBox({width:65,data:option.andOrData,value:"and"});
                }
                $("#"+fieldControlId).ligerComboBox({width:100,data:option.fields,textField:"text",extendField:"type",
                    onSelected:function(value,text,row){
                        //改变条件控件
                        if(row.type=="NUMERIC"||row.type=="FLOAT")
                        {
                            $("#"+conditionControlId).ligerComboBox("setData",option.numberTypeData)
                        }
                        else if(row.type=="DATE"){
                            $("#"+conditionControlId).ligerComboBox("setData",option.dateTypeData)
                        }
                        else{
                            $("#"+conditionControlId).ligerComboBox("setData",option.stringTypeData)
                        }

                        $("#"+conditionControlId).ligerComboBox("setValue"," = ");
                    }
                });
                $("#"+conditionControlId).ligerComboBox({width:80});



                if(andOr!=undefined)
                {
                    $("#"+andOrControlId).ligerComboBox("setValue",andOr);
                }
                if(field!=undefined)
                {
                    $("#"+fieldControlId).ligerComboBox("setValue",field);
                }
                if(condition!=undefined)
                {
                    $("#"+conditionControlId).ligerComboBox("setValue",condition);
                }
                if(value!=undefined)
                {
                    me.changeValueType(index,value);
                    //$("#"+conditionControlId).ligerComboBox("setValue",condition);
                }

                //绑定事件
                $("#"+conditionControlId).ligerComboBox({
                    onSelected:function(value,text){
                        //改变值控件
                        me.changeValueType(index);
                    }
                });

                option.index = index+1;
            },
            //改变值控件类型
            changeValueType:function(index,value){
                try{
                    var me = this;
                    var option = me.options;
                    var groupId = me.textFieldID+"_"+index;
                    var fieldControlId = groupId+"_"+option.fieldControlFlag;
                    var conditionControlId = groupId+"_"+option.conditionControlFlag;

                    var field = $("#"+fieldControlId).ligerComboBox("getSelected");
                    var condition = $("#"+conditionControlId).ligerComboBox("getValue");

                    if(field==null || condition==null)
                    {
                        return;
                    }
                    var dict =field.dict;
                    var dataType = field.type;

                    var type="textbox";

                    if(dataType == "NUMERIC")//数值
                    {
                        type = "numberbox";
                    }
                    else if(dataType == "DATE") //时间
                    {
                        type = "datebox";
                    }
                    else{
                        if(dict!=null && dict!="0")//字典控件
                        {
                            if(condition == " IN " || condition == " NOT IN ")
                            {
                                type = "mult_combobox";
                            }
                            else{
                                type = "combobox";
                            }
                        }
                        else{
                            if(condition == " IN " || condition == " NOT IN ")
                            {
                                type = "mult_textbox";
                            }
                        }
                    }


                    me.createValueControl(index,type,dict,value);
                }
                catch(e)
                {
                    return;
                }

            },
            //创建值控件
            createValueControl:function(index,type,dict,value){
                var me = this;
                var option = me.options;
                var groupId = me.textFieldID+"_"+index;
                var valueControlId = groupId+"_"+option.valueControlFlag;
                var valueDiv =$("#"+groupId+"_"+option.valueControlFlag+"_div");

                var oldType = valueDiv.attr("controlType");
                if(oldType != type || value!=undefined)
                {
                    if(value==undefined) value = "";

                    valueDiv.attr("controlType",type)
                    if(type=="combobox") //字典
                    {
                        valueDiv.html('<input type="text" id="'+valueControlId+'" data-type="select"/>');
                        var parms = {dictId:dict};
                        $.extend(parms,option.stdDictParms);
                        $("#"+valueControlId).ligerComboBox({width:200,url:option.stdDictUrl,urlParms:parms,value:value});
                    }
                    else if(type=="datebox") //时间
                    {
                        valueDiv.html('<input type="text" id="'+valueControlId+'" />');
                        $("#"+valueControlId).ligerDateEditor({width:200,value:value});
                    }
                    else if(type=="numberbox") //数值
                    {
                        valueDiv.html('<input type="text" id="'+valueControlId+'" />');
                        $("#"+valueControlId).ligerTextBox({width: 200,digits:true,value:value});
                    }
                    else if(type=="mult_combobox") //多选字典
                    {
                        valueDiv.html('<input type="text" id="'+valueControlId+'" />');
                        var parms = {dictId:dict};
                        $.extend(parms,option.stdDictParms);
                        $("#"+valueControlId).ligerMultbox({width:200,stdDictUrl:option.stdDictUrl,urlParms:parms,value:value});
                    }
                    else if(type=="mult_textbox") //多项文本
                    {
                        valueDiv.html('<input type="text" id="'+valueControlId+'" />');
                        $("#"+valueControlId).ligerMultbox({width:200,value:value});
                    }
                    else //文本框
                    {
                        valueDiv.html('<input type="text" id="'+valueControlId+'"  class="l-textbox" value="'+value+'"/>');
                    }
                }
            }
        });


    /******************* 搜索控件 *************************************/
        //add by hzp at 20160223
    $.fn.ligerSearch = function ()
    {
        return $.ligerui.run.call(this, "ligerSearch", arguments);
    };

    $.ligerDefaults.Search = {
        onChange: null,    //改变值事件
        onClick: null,    //搜索按钮事件
        disabled: false,
        readonly: false              //是否只读
    };

    $.ligerMethos.Search = {};

    $.ligerui.controls.Search = function (element, options)
    {
        $.ligerui.controls.Search.base.constructor.call(this, element, options);
    };

    $.ligerui.controls.Search.ligerExtend($.ligerui.controls.Input, {
        __getType: function ()
        {
            return 'Search';
        },
        _extendMethods: function ()
        {
            return $.ligerMethos.Search;
        },
        _init: function () {
            $.ligerui.controls.Search.base._init.call(this);
        },
        _render: function ()
        {
            var g = this, p = this.options;
            g.inputText = null;
            g.value = null;
            g.textFieldID = "";
            if (this.element.tagName.toLowerCase() == "input" && this.element.type && this.element.type == "text")
            {
                g.inputText = $(this.element);
                if (this.element.id)
                    g.textFieldID = this.element.id;
            }
            else
            {
                g.inputText = $('<input type="text"/>');
                g.inputText.appendTo($(this.element));
            }
            if (g.textFieldID == "" && p.textFieldID)
                g.textFieldID = p.textFieldID;

            g.searchBtn = $('<div class="l-trigger l-trigger-search"><div class="l-trigger-icon"></div></div>');
            g.wrapper = g.inputText.wrap('<div class="l-text"></div>').parent();
            g.wrapper.append(g.searchBtn);
            g.inputText.addClass("l-text-field");

            //设置宽度
            if(p.width)
            {
                g.wrapper.width(p.width);
                g.inputText.width(p.width-12);
            }

            if (p.disabled)
            {
                g.wrapper.addClass("l-text-disabled");
            }
            //初始化
            if (g.value!=null)
            {
                g.setValue(g.value);
            }

            //点击事件
            if(!p.disabled && p.onClick!=null && typeof(p.onClick)=="function")
            {
                g.searchBtn.click(function(){
                    p.onClick(g.getValue());
                });
            }

            //值改变事件
            if(!p.disabled && p.onChange!=null && typeof(p.onChange)=="function")
            {
                g.inputText.change(function () {
                    p.onChange(g.getValue());
                });
            }

            g.inputText.blur(function ()
            {
                if (!p.disabled)
                    g.wrapper.removeClass("l-text-focus");
            }).focus(function ()
            {
                if (!p.disabled)
                    g.wrapper.addClass("l-text-focus");
            });
            g.wrapper.hover(function ()
            {
                if (!p.disabled)
                    g.wrapper.addClass("l-text-over");
            }, function ()
            {
                g.wrapper.removeClass("l-text-over");
            });
        },
        setValue: function (value)
        {
            var g = this, p = this.options;
            if (!value || value == "NaN") value = "";

            this.inputText.val(value)
        },
        getValue:function()
        {
            return this.inputText.val();
        }
    });

    /******************* 多选控件 *************************************/
    //add by hzp at 20160223
    $.fn.ligerMultbox = function ()
    {
        return $.ligerui.run.call(this, "ligerMultbox", arguments);
    };

    $.ligerDefaults.Multbox = {
        disabled: false,
        readonly: false,              //是否只读
        boxType:"text",
        gridOptions: {

        },
        valueField: 'CustomerID',
        textField: 'CustomerID'
    };

    $.ligerMethos.Multbox = {};

    $.ligerui.controls.Multbox = function (element, options)
    {
        $.ligerui.controls.Multbox.base.constructor.call(this, element, options);
    };

    $.ligerui.controls.Multbox.ligerExtend($.ligerui.controls.Input, {
        __getType: function ()
        {
            return 'Multbox';
        },
        _extendMethods: function ()
        {
            return $.ligerMethos.Multbox;
        },
        _init: function () {
            $.ligerui.controls.Multbox.base._init.call(this);
        },
        _render: function ()
        {
            var g = this, p = this.options;
            g.inputValue = null;
            g.inputControl = null;
            g.value = null;
            g.textFieldID = "";
            if (this.element.tagName.toLowerCase() == "input" && this.element.type)
            {
                if(this.element.type == "text")
                {
                    $(this.element).attr("type","hidden");
                }
                g.inputValue = $(this.element);
                if (this.element.id)
                    g.textFieldID = this.element.id;
            }

            if (g.textFieldID == "" && p.textFieldID)
                g.textFieldID = p.textFieldID;


            g.addBtn = $('<div class="m-form-mult-add"></div>');
            g.addBtnWrapper = g.addBtn.wrap('<div class="m-form-mult-add-panel"></div>').parent();
            g.addBtnWrapper.append('<div class="m-form-mult-control-panel"><input type="text" id="'+g.textFieldID+'_control"  class="l-textbox" style="float:left;width:135px;margin-top:5px;margin-left:5px;"/><a href="javascript:void(0);" id="'+g.textFieldID+'_control_cancle" class="m-btn-cancle" style="float: right"></a><a href="javascript:void(0);" id="'+g.textFieldID+'_control_ok" class="m-btn-ok" style="float: right"></a></div>');

            g.wrapper = g.inputValue.wrap('<div class="m-form-mult"></div>').parent();
            g.wrapper.append('<div class="m-form-mult-blank"></div><div class="m-form-mult-content"  id="'+g.textFieldID+'_content"></div>').after(g.addBtnWrapper);
            g.inputControl = $("#"+g.textFieldID+"_control");
            g.content = $("#"+g.textFieldID+"_content");

            g.wrapper.wrap('<div style="position: relative"></div>');

            //字典控件
            if(p.stdDictUrl!=null)
            {

                p.boxType = "combo";
                /*g.inputControl.ligerComboBox({width:135,url:p.stdDictUrl,urlParms:p.urlParms});
                if(g.inputControl[0].type == "text")
                {
                    $(g.inputControl).attr("type","hidden");
                }*/
            }
            g.setWidth();

            //初始化
            if (p.value!=null)
            {
                g.setValue(p.value);
            }

            //禁用
            if (p.disabled)
            {
                g.wrapper.addClass("l-text-disabled");
                //按钮失效
                return;
            }

            //添加按钮
            g.addBtn.click(function(){
                if(p.boxType != "text")
                {
                    //弹窗多选字典数据
                    var val = g.getValue();
                    g.selectDialog(val,function(val,text){
                        g.setValue(val,text);
                    });
                }
                else
                {
                    g.inputControl.val('');
                    $(this).next().show();
                }

            })

            //添加确认按钮
            $("#"+g.textFieldID+"_control_ok").click(function(){
                var val = g.inputControl.val();
                var text = g.inputControl.val();
                if(val!=null && val.length>0)
                {
                    if(g.inputControl.prev().hasClass('l-text-combobox')){
                        text = g.inputControl.ligerComboBox("getText");
                    }
                    if(val.indexOf(',')>=0)
                    {
                        $.ligerDialog.error("不能包含特殊字符!");
                        return;
                    }
                    g.newItem(val,text);
                    $(this).parent().hide();
                }

            });
            //添加取消按钮
            $("#"+g.textFieldID+"_control_cancle").click(function(){
                $(this).parent().hide();
            });
        },
        newItem:function(val,text){
            var me = this;
            var b = true;
            $.each(me.content.find("div"),function(index,item){
                var value = $(item).attr("value");
                if(value == val)
                {
                    b=false;
                    return;
                }
            });
            if(b)
            {
                me.content.append('<div value="'+val+'">'+text+'<a href="javascript:void(0);" onclick="$(this).parent().remove()"></a></div>');
            }
        },
        setWidth:function(){
            var me = this;
            var option = me.options;
            if(option.width!=null)
            {
                me.wrapper.css({width:option.width});
                me.content.css({width:option.width-5});
                me.addBtnWrapper.css({width:option.width});
            }
        },
        setValue: function (val,text)
        {
            var me = this, option = me.options;
            if (!val || val == "NaN") val = "";
            me.content.find("div").remove();
            if(text!=undefined&&text.length>0)
            {
                var arr = val.split(',');
                var arrText = text.split(',');
                if(arr.length == arrText.length)
                {
                    for(var i=0;i<arr.length;i++)
                    {
                        me.newItem(arr[i],arrText[i]);
                    }
                }

            }
            else{
                if(val.length>0)
                {
                    var arr = val.split(',');
                    if(option.boxType!="text")
                    {
                        $.ajax({ //获取表的字段列表
                            type: "POST",
                            url : option.stdDictUrl,
                            dataType : "json",
                            data:option.urlParms,
                            cache:false,
                            success :function(data){
                                if(data.successFlg) {
                                    if(data.detailModelList!=null && data.detailModelList.length>0)
                                    {
                                        for(var i=0;i<arr.length;i++)
                                        {
                                            for(var j=0;j<data.detailModelList.length;j++)
                                            {
                                                var code = data.detailModelList[j].code;
                                                if(code==arr[i])
                                                {
                                                    me.newItem(code,data.detailModelList[j].value);
                                                    break;
                                                }
                                            }
                                        }

                                    }
                                }
                                else{
                                    $.ligerDialog.error(data.message);
                                }
                            },
                            error :function(data){
                                $.ligerDialog.error("Status:"+data.status +"(" +data.statusText+")");
                            }
                        });
                    }
                    else{
                        for(var i=0;i<arr.length;i++)
                        {
                            me.newItem(arr[i],arr[i]);
                        }
                    }
                }
            }

            me.inputValue.val(val);
        },
        getValue:function()
        {
            var me = this;
            var val = "";
            $.each(me.content.find("div"),function(index,item){
                var value = $(item).attr("value");
                if(val.length==0)
                {
                    val = value;
                }
                else{
                    val += ","+value;
                }
            });

            me.inputValue.val(val);
            return val;
        },
        //弹窗选取字典
        selectDialog:function(val,fun){
            var me = this;
            var option = me.options;
            if(option.stdDictUrl!=null)
            {
                me.popupFn = $.ligerui.getPopupFn({
                    width:550,
                    /*condition: {
                        autoEditors:true,
                        fields: [{ display: "名称", name: "value", type: 'text' }]
                    },*/
                    grid:  {
                        columns: [
                            { display: '代码', name: 'code' },
                            { display: '名称', name: 'value' },
                            { display: '属性', name: 'extend' }
                        ],
                        switchPageSizeApplyComboBox: false,
                        url: option.stdDictUrl,
                        parms:option.urlParms,
                        pageSize: 50,
                        checkbox: true
                    },
                    valueField: 'code',
                    textField: 'value',
                    split: ',',
                    onSelect: function (e)
                    {
                        fun(e.value,e.text);
                        me.trigger('selected', e);
                    },
                    selectInit: function (rowdata)
                    {
                        var re =false;
                        if(val!=undefined&&val.length>0)
                        {
                            var arr = val.split(',');
                            for(var i=0;i<arr.length;i++)
                            {
                                if(arr[i]==rowdata.code)
                                {
                                    re = true;
                                    break;
                                }
                            }
                        }
                        return re;
                    }
                });
                me.popupFn();
            }
        }
    });

    /***************** 表单控件 **********************************/
    //add by hzp at 20160312
    $.fn.ligerAutoForm = function ()
    {
        return $.ligerui.run.call(this, "ligerAutoForm", arguments);
    };

    $.ligerDefaults.AutoForm = {
        data:null,

        readonly: false,           //是否只读
        validate:null, //校验
        message:null //校验提示
    };

    $.ligerMethos.AutoForm = {
        showError:function(control,error){

            var dom = $(control).closest(".m-form-control");

            if(dom.hasClass('m-from-error'))
            {
                dom.removeClass('m-from-error').find('.m-from-error-msg').remove();
            }

            var el = $('<div class="m-from-error-msg"></div>');
            dom.addClass('m-from-error').append(el);

            el.hover(function ()
            {
                $(this).ligerTip({content:error});
            },function (){
                $(this).ligerHideTip();
            });
        }
    };

    $.ligerui.controls.AutoForm = function (element, options)
    {
        $.ligerui.controls.AutoForm.base.constructor.call(this, element, options);
    };



    $.ligerui.controls.AutoForm.ligerExtend($.ligerui.core.UIComponent, {
        controls:[], //表单控件
        defaultMessage:{
            required: "必填项",
            email: "请输入有效的电子邮件地址",
            ip: "请输入有效的ip地址",
            date: "请输入有效的日期",
            dateISO: "请输入有效的日期 (YYYY-MM-DD)",
            number: "请输入有效的数字",
            digits: "只能输入数字",
            equalTo: "你的输入不相同",
            extension: "请输入有效的后缀",
            maxlength: "最多可以输入{0}个字符",
            minlength: "最少要输入{0}个字符",
            max: "请输入不大于{0}的数值",
            min: "请输入不小于{0}的数值",
            custom:"自定义函数出错",
            phone:"请输入有效的电话号码"
        },
        __getType: function ()
        {
            return 'AutoForm'
        },
        __idPrev: function ()
        {
            return 'AutoForm';
        },
        _init: function ()
        {
            var g = this, p = this.options;
            $.ligerui.controls.AutoForm.base._init.call(this);
        },
        _render: function ()
        {
            var me = this, option = this.options;

            /********** 初始化控件 ***********/
            me.controls = [];
            var jform = $(this.element);
            $("textarea", jform).each(function () {
                try {
                    var name = $(this).attr("name");
                    if (name != undefined && name.length > 0) {
                        me.controls.push({name: name, control: $(this)});
                    }
                }
                catch(e){
                    return;
                }
            });
            $("input", jform).each(function ()
            {
                try{
                    var name = $(this).attr("name");
                    var control = null;
                    var controlType = "html"; //html为html控件 ui为ligerUI控件
                    var rule = null; //校验规则
                    var message = null; //校验提示信息
                    if(name!=undefined && name.length>0)
                    {
                        //是否已存在
                        for(var i=0;i<me.controls.length;i++)
                        {
                            if(me.controls[i].name == name)
                            {
                                return;
                            }
                        }

                        var type = $(this).attr("type");

                        if(type == "radio")//单选
                        {
                            control = $('input[name="'+name+'"]').ligerRadio();
                            controlType = "ui";
                        }
                        else if(type == "checkbox")//多选
                        {
                            control = $('input[name="'+name+'"]').ligerCheckBox();
                            controlType = "ui";
                        }
                        else if(type=="hidden")
                        {
                            if($(this).attr("data-ligerid"))
                            {
                                return;
                            }
                            else{
                                control = $(this);
                            }
                        }
                        else{
                            var wrap = $(this).parent();
                            if(wrap.hasClass("l-text-combobox")) //下拉控件
                            {
                                control = $(this).ligerComboBox();
                                controlType = "ui";
                            }
                            else if(wrap.hasClass("l-text-date"))
                            {
                                control = $(this).ligerDateEditor();
                                controlType = "ui";
                            }
                            else{
                                control = $(this);
                            }
                        }

                        //相关校验规则
                        if(option.validate!=null && option.validate[name]!=null)
                        {
                            rule = option.validate[name];
                            if(option.message!=null && option.message[name]!=null)
                            {
                                message = option.message[name];
                            }
                        }

                        me.controls.push({name:name,controlType:controlType,control:control,rule:rule,message:message});
                    }
                }
                catch(e)
                {
                    return;
                }
            });

            /********* 初始化数据 **********/
            if(option.data)
            {
                me.setData(option.data);
            }

            /********** 只读 ************/
            if(option.readonly)
            {
                me.readOnly();
            }

        },
        //初始化数据
        setData:function(data){
            try{
                var me = this, option = this.options;

                for(var i=0;i<me.controls.length;i++)
                {
                    var controlName = me.controls[i].name;
                    var control = me.controls[i].control;
                    var controlType = me.controls[i].controlType;
                    var controlData = data[controlName];
                    if(controlData!=undefined)
                    {
                        if(controlType=="ui"&&typeof(control.setValue)=="function")
                        {
                            control.setValue(controlData);
                        }
                        else{
                            if(typeof(control.setValue)=="function")
                            {
                                control.setValue(controlData);
                            }
                            if(typeof(control.val)=="function")
                            {
                                control.val(controlData);
                            }
                            else{
                                control.html(controlData);
                            }
                        }

                    }
                }
            }
            catch(e)
            {
                return;
            }
        },
        //校验规则
        validateRule:function(rule,ruleValue,value){
            try{
                var me = this;
                //字符串格式化方法
                String.prototype.format= function() {
                    var args = arguments;
                    return this.replace(/\{(\d+)\}/g, function (s, i) {
                        return args[i];
                    });
                };

                var message = me.defaultMessage[rule];

                if(rule=="required" && (ruleValue ==true ||ruleValue=="true"))
                {
                    if(value == null || value.length ==0)
                    {
                        return message;
                    }
                }
                else if(rule== "equalTo")
                {
                    if(ruleValue=="") {
                        return "密码未输入";
                    }
                    else if(ruleValue!=value && value!="") {
                        return message;
                    }
                }

                else{

                    if(value !=null &&value.length>0)
                    {
                        switch (rule)
                        {
                            case "email":
                            {
                                var re =new RegExp("^([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\\_|\\.]?)*[a-zA-Z0-9]+\\.[a-zA-Z]{2,3}$");
                                if(!re.test(value))
                                {
                                    return message;
                                }
                                break;
                            }
                            case "phone":
                            {
                                debugger
                                var isPhone = /^(0[1-9]{2})-\d{8}$|^(0[1-9]{3}-(\d{7,8}))$/;
                                var isMobile = /^(13|14|15|17|18)[0-9]{9}$/

                                if (!isPhone.test(value) && !isMobile.test(value)) {
                                    return message;
                                }
                                break;
                            }
                            case "ip":
                            {
                                 var re =new RegExp("^(2[5][0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})$");
                                debugger
                                if(!re.test(value))
                                {
                                    return message;
                                }
                                break;
                            }
                            case "date":
                            {
                                break;
                            }
                            case "dateISO":
                            {
                                break;
                            }
                            case "number":
                            {
                                break;
                            }
                            case "digits":
                            {
                                var re =new RegExp("^[0-9]*$");
                                if(!re.test(value))
                                {
                                    return message;
                                }
                                break;
                            }

                            case "extension"://请输入有效的后缀
                            {
                                break;
                            }
                            case "maxlength"://最多可以输入 {0} 个字符
                            {
                                if(value.length>ruleValue)
                                {
                                    return message.format(ruleValue);
                                }
                                break;
                            }
                            case "minlength"://最少要输入 {0} 个字符
                            {
                                if(value.length<ruleValue)
                                {
                                    return message.format(ruleValue);
                                }
                                break;
                            }
                            case "max"://请输入不大于 {0} 的数值
                            {
                                if(value>ruleValue)
                                {
                                    return message.format(ruleValue);
                                }
                                break;
                            }
                            case "min"://请输入不小于 {0} 的数值
                            {
                                if(value<ruleValue)
                                {
                                    return message.format(ruleValue);
                                }
                                break;
                            }
                        }
                    }
                }


                return "";
            }
            catch(e)
            {
                return e;
            }
        },
        //校验值
        validate:function(){
            try {
                var me = this, option = this.options;
                me.flag = 100;//错误等级
                var suc = true;
                if (me.controls != null) {
                    var data = me.getData();
                    for (var i = 0; i < me.controls.length; i++) {

                        var control = me.controls[i];
                        var name = control["name"];

                        var rule = control["rule"];

                        var message = control["message"];
                        var error = "";
                        var terror = "";
                        if (rule != null) {
                            var value = data[name];
                            if (typeof(rule) == "string") {
                                error = me.validateRule(rule, true, value);

                            }
                            else {
                                for (var o in rule) {
                                    var val = rule[o];
                                    //判断相等情况，以赋值替代val
                                    if (o == "equalTo") {
                                        val = data[val];
                                    }
                                    terror = me.validateRule(o, val, value);
                                    if (terror.length > 0) {

                                        if (o == "required") {
                                            me.flag = 1;
                                            error = terror;
                                        }
                                        else if (o == "minlength") {
                                            if (me.flag > 2) {
                                                me.flag = 2;
                                                error = terror;
                                            }
                                        }
                                        else if (o == "maxlength") {
                                            if (me.flag > 3) {
                                                me.flag = 3;
                                                error = terror;
                                            }
                                        }
                                        //判断相等情况，以赋值替代val
                                        else if (o == "equalTo") {
                                            if (me.flag > 4) {
                                                me.flag = 4;
                                                error = terror;
                                            }
                                        }
                                        else if (o == "digits") {
                                            if (me.flag > 5) {
                                                me.flag = 5;
                                                error = terror;
                                            }
                                        }
                                        else if (o == "email") {
                                            if (me.flag > 6) {
                                                me.flag = 6;
                                                error = terror;
                                            }
                                        }
                                        else if (o == "ip") {
                                            if (me.flag > 7) {
                                                me.flag = 7;
                                                error = terror;
                                            }
                                        }
                                        //error += ";"+re;
                                    }
                                    else {

                                    }
                                }
                            }
                        }

                        //是否报错
                        if (error.length > 0) {
                            if(message!=undefined&&message!=null)
                            {
                                if (typeof(message) == "string")
                                {
                                    error = message;//用户自定义消息覆盖默认消息
                                }
                                else {
                                    for (var m in message) {
                                        var value = message[m];
                                        if (m == "required" && me.flag == 1) {
                                            error = value;
                                        }
                                        else if (m == "minlength" && me.flag == 2) {

                                            error = value;
                                        }
                                        else if (m == "maxlength" && me.flag == 3) {
                                            error = value;
                                        }
                                        //判断相等情况，以赋值替代val
                                        else if (m == "equalTo" && me.flag == 4) {
                                            error = value;
                                        }
                                        else if (m == "digits" && me.flag == 5) {
                                            error = value;
                                        }
                                        else if (m == "email" && me.flag == 6) {
                                            error = value;
                                        }
                                        else if (m == "ip" && me.flag == 7) {
                                            error = value;
                                        }
                                    }
                                }
                            }

                            me.showError(control, error);
                            /*if (me.flag == 1) {
                                me.showError(control, error);//required优先级高
                            }
                            else if (me.flag == 2) {
                                me.showError(control, error);//
                            }
                            else if (me.flag == 3) {
                                me.showError(control, error);//
                            }
                            else if (me.flag == 4) {
                                me.showError(control, error);//
                            }
                            else if (me.flag == 5) {
                                me.showError(control, error);//
                            }
                            else if (me.flag == 6) {
                                me.showError(control, error);//
                            }
                            else if (me.flag == 7) {
                                me.showError(control, error);//
                            }*/

                            //else  if(message!=null && message.length > 0){
                            // me.showError(control,message);
                            // }
                            suc = false;
                        }
                    else
                        {
                            me.clearError(control);
                        }
                    }
                    return suc;
                }
            }
            catch(e)
            {
                return false;
            }
        },
        //清除某个控件错误提示
        clearError:function(control){
            var me = this;
            var dom;
            if(control.controlType == "ui")
            {
                dom = $(control.control.element).closest(".m-form-control");
            }
            else{
                dom = control.control.closest(".m-form-control");
            }
            dom.removeClass('m-from-error').find('.m-from-error-msg').remove();
        },
        //某个控件错误提示
        showError:function(control,error){
            var me = this;
            var dom;
            if(control.controlType == "ui")
            {
                dom = $(control.control.element).closest(".m-form-control");
            }
            else{
                dom = control.control.closest(".m-form-control");
            }

            if(dom.hasClass('m-from-error'))
            {
                me.clearError(control);
            }

            var el = $('<div class="m-from-error-msg"></div>');
            dom.addClass('m-from-error').append(el);

            el.hover(function ()
            {
                $(this).ligerTip({content:error});
            },function (){
                $(this).ligerHideTip();
            });
        },
        //只读操作
        readOnly:function(){

        },
        //获取数据
        getData:function(){
            var me = this, option = this.options;
            var data = {};
            for(var i=0;i<me.controls.length;i++)
            {
                var controlName = me.controls[i].name;
                var control = me.controls[i].control;
                var controlType = me.controls[i].controlType;

                if(controlType=="ui"&&typeof(control.getValue)=="function")
                {
                    data[controlName] = control.getValue();
                }
                else{
                    if(typeof(control.getValue)=="function")
                    {
                        data[controlName] = control.getValue();
                    }
                    if(typeof(control.val)=="function")
                    {
                        data[controlName] = control.val();
                    }
                    else{
                        data[controlName] = control.html();
                    }
                }

            }

            return data;
        }
    });
})(jQuery, window);
