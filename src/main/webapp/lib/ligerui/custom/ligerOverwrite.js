/**
 * ligerUI BUG修复和重写
 */
(function ($, win) {

    /***************** 字典相关扩展 *************************/
        //字典数据
    $.ehrDict = {
        dictDataUrl: window.root + "/basedict/getDict", //字典数据获取路径
        dictCodeName: "code", //字典code字段
        dictValueName: "value", //字典Value字段
        dictExtendName: "extend", //字典扩展字段
        sysDict: {}, //系统字典
        orgDict: {}, //机构字典
        stdDitc: {}, //标准字典
        //后台加载数据
        loadDictData: function (dictName, type, where, callBack) {
            var me = this;
            $.post(
                me.dictDataUrl,
                {type: type, name: dictName, where: where},
                function (data, status) {
                    try {
                        if (data.successFlg) {
                            var list = data.detailModelList;
                            if (type == "1") //机构字典
                            {
                                me.orgDict[dictName] = list;
                            }
                            else if (type == "2") { //标准字典
                                me.stdDitc[dictName] = list;
                            }
                            else { //系统字典
                                me.sysDict[dictName] = list;
                            }

                            if ($.isFunction(callBack)) {
                                callBack(me.listToDict(list));
                            }
                        }

                    }
                    catch (e) {
                        return;
                    }
                });
        },
        //格式转化
        listToDict: function (list) {
            var me = this;
            var dictItem = {};
            for (var item in list) {
                dictItem[list[item][me.dictCodeName]] = {
                    value: list[item][me.dictValueName],
                    extend: list[item][me.dictExtendName]
                };
            }

            return dictItem;
        },
        //获取字典数据
        getDictData: function (dictName, type, where, callBack) {
            var me = this;
            if (dictName != null && dictName.length > 0) {
                var re = null;
                if (type == "1") //机构字典
                {
                    re = me.orgDict[dictName];
                }
                else if (type == "2") { //标准字典
                    re = me.stdDitc[dictName];
                }
                else { //系统字典
                    re = me.sysDict[dictName];
                }

                if (re != null) {
                    if (re != "loading") {
                        return re;
                    }
                }
                else {
                    if (type == "1") {
                        me.orgDict[dictName] = "loading";
                    }
                    else if (type == "2") {
                        me.stdDitc[dictName] = "loading";
                    }
                    else {
                        me.sysDict[dictName] = "loading";
                    }
                    //加载数据
                    me.loadDictData(dictName, type, where, callBack);
                }

            }

            return null;
        }
    };

    /******************************************************/

    //重写条件选择控件 add by hzp at 20160119
    $.extend($.ligerui.controls.Filter.prototype, {
        getValue: function () {
            var me = this;
            var options = me.options;
            var datas = me.getData();

            return datas;
        }
    });

    //重写下拉控件 add by hzp at 20160108
    $.extend($.ligerDefaults.ComboBox, {
        selectBoxWidth: 240,
        resize: false,
        valueField: 'code',
        textField: 'value',
        extendField: 'extend',
        dataParmName: 'detailModelList',
        dict: false, //是否下拉字典控件
        dictName: null, //字典名称
        dictType: null, //1机构字典 2标准字典 默认系统字典
        dictWhere: "" //表字典附加SQL条件
    });
    $.extend($.ligerui.controls.ComboBox.prototype, {
        _setUrl: function (url, callback) {
            var g = this, p = this.options;
            /****************** 下拉字典 ***********************/
            if (p.dict) {


                var dict = $.ehrDict.getDictData(p.dictName, p.dictType, p.dictWhere);
                if (dict != null) {
                    g.setData(dict);
                    return;
                }
                else {
                    p.url = url = $.ehrDict.dictDataUrl;
                    p.urlParms = {name: p.dictName, type: p.dictType, where: p.dictWhere};
                }
            }
            /***************************************************/

            if (!url) return;

            if (p.readonly) //只读状态不加载数据
            {
                return;
            }
            if (p.delayLoad && !g.isAccessDelay && !g.triggerLoaded) {
                g.isAccessDelay = true;//已经有一次延时加载了
                return;
            }
            url = $.isFunction(url) ? url.call(g) : url;
            var urlParms = $.isFunction(p.urlParms) ? p.urlParms.call(g) : p.urlParms;
            if (urlParms) {
                for (name in urlParms) {
                    url += url.indexOf('?') == -1 ? "?" : "&";
                    url += name + "=" + urlParms[name];
                }
            }
            var parms = $.isFunction(p.parms) ? p.parms.call(g) : p.parms;
            if (p.ajaxContentType == "application/json" && typeof (parms) != "string") {
                parms = liger.toJSON(parms);
            }
            var ajaxOp = {
                type: p.ajaxType,
                url: url,
                data: parms,
                cache: false,
                dataType: 'json',
                beforeSend: p.ajaxBeforeSend,
                complete: p.ajaxComplete,
                success: function (result) {
                    var data = $.isFunction(p.dataGetter) ? data = p.dataGetter.call(g, result) : result;
                    data = p.dataParmName && data ? data[p.dataParmName] : data;
                    if (g.trigger('beforeSetData', [data]) == false) {
                        return;
                    }
                    g.setData(data);
                    g.trigger('success', [data]);
                    if ($.isFunction(callback)) callback(data);
                },
                error: function (XMLHttpRequest, textStatus) {
                    g.trigger('error', [XMLHttpRequest, textStatus]);
                }
            };
            if (p.ajaxContentType) {
                ajaxOp.contentType = p.ajaxContentType;
            }
            $.ajax(ajaxOp);
        },
        /***** 获取选中BUG修复 add by hzp at 20160224 **************/
        getSelected:function(){
            if(this.selected!=null)
            {
                return this.selected;

            }
            else{
                var me = this;
                var options = me.options;
                var selected = me.selectedValue;
                for (var i = 0; i < me.data.length; i++) {
                    var item = me.data[i];
                    if (item[options.valueField] == selected) {
                        return item;
                    }
                }
            }
        },
        _setDisabled: function (value)
        {
            //禁用样式
            if (value)
            {
                this.wrapper.addClass('l-text-disabled');
                $(".l-trigger-cancel").remove();
            } else
            {
                this.wrapper.removeClass('l-text-disabled');
            }
        },
        //获取扩展字段
        getExtendValue: function () {
            try {
                var me = this;
                var options = me.options;
                var selected = me.selectedValue;
                for (var i = 0; i < me.data.length; i++) {
                    var item = me.data[i];
                    if (item[options.valueField] == selected) {
                        return item[options.extendField];
                    }
                }
            }
            catch (e) {
                return "";
            }

        },
        /****** 下拉树宽度BUG修复 add by hzp at 20160602***********************/
        bulidContent: function ()
        {
            var g = this, p = this.options;
            this.clearContent();
            if (g.select)
            {
                g.setSelect();
            }
            else if (p.tree)
            {
                /*******/
                p.tree.width=g.inputText.width();
                /*******/
                g.setTree(p.tree);
            }
        }
    });


    //重写Grid控件 add by hzp at 20160107
    $.extend($.ligerDefaults.Grid, {
        // 存储总记录数的字段名
        record: 'totalCount',
        // 数据源字段名
        root: 'detailModelList',
        // 每页记录数
        pageSize: 20,
        // 页记录数参数名，(提交给服务器)
        pagesizeParmName: 'rows',
        // 高度补差，当设置height:100%时，可能会有高度的误差，可以通过这个属性调整
        heightDiff: -14,
        height: '100%',
        // 是否显示行序号
        rownumbers: true,
        // 表头行的高度
        headerRowHeight: 40,
        // 行的高度
        rowHeight: 40,
        // 编辑器位置误差调整
        editorTopDiff: 1,
        allowAdjustColWidth: true
    });
    $.extend($.ligerui.controls.Grid.prototype, {
        _setHeight: function (h) {
            var g = this, p = this.options;
            g.unbind("SysGridHeightChanged");
            if (h == "auto")
            {
                g.bind("SysGridHeightChanged", function ()
                {
                    if (g.enabledFrozen())
                        g.gridview.height(Math.max(g.gridview1.height(), g.gridview2.height()));
                });
                return;
            }
            h = g._calculateGridBodyHeight(h);
            if (h > 0)
            {
                /** 列表高度计算bug修改 **/
                var gridHeaderHeight = (p.headerRowHeight+1) * (g._columnMaxLevel - 1) + p.headerRowHeight + 1;
                /***********************/
                /******** 隐藏表头 add by hzp at 2016-05-05 ************/
                if(p.hideHeader)
                {
                    h += 41;
                    g.gridheader.hide();
                    gridHeaderHeight = 0;
                }

                /*****************************************************/
                g.gridbody.height(h);
                if (p.frozen)
                {
                    /*** 滚动条样式修改 add by hzp at 20160215***/
                    //解决冻结列和活动列由上至下滚动错位的问题
                    var w = g.gridbody.width(), w2 = $(":first-child", g.gridbody).width();
                    if (w2 && (w2 + 6 >= w))
                    {
                        if (h > 6)
                            g.f.gridbody.height(h - 6);
                    }
                    else
                    {
                        g.f.gridbody.height(h);
                    }
                    /********************************************/
                }


                g.gridview.height(h + gridHeaderHeight);
            }
            g._updateHorizontalScrollStatus.ligerDefer(g, 10);


        },
        //是否固定列
        _onResize: function ()
        {
            var g = this, p = this.options;
            if (p.height && p.height != 'auto')
            {
                var windowHeight = $(window).height();
                //if(g.windowHeight != undefined && g.windowHeight == windowHeight) return;

                var h = 0;
                var parentHeight = null;
                if (typeof (p.height) == "string" && p.height.indexOf('%') > 0)
                {
                    var gridparent = g.grid.parent();
                    if (p.inWindow)
                    {
                        parentHeight = windowHeight;
                        parentHeight -= parseInt($('body').css('paddingTop'));
                        parentHeight -= parseInt($('body').css('paddingBottom'));
                    }
                    else
                    {
                        parentHeight = gridparent.height();
                    }
                    h = parentHeight * parseInt(p.height) * 0.01;
                    if (p.inWindow || gridparent[0].tagName.toLowerCase() == "body")
                        h -= (g.grid.offset().top - parseInt($('body').css('paddingTop')));
                }
                else
                {
                    h = parseInt(p.height);
                }

                h += p.heightDiff;
                g.windowHeight = windowHeight;
                g._setHeight(h);
            }
            else
            {
                g._updateHorizontalScrollStatus.ligerDefer(g, 10);
            }
            if (g.enabledFrozen())
            {
                var gridView1Width = g.gridview1.width();
                var gridViewWidth = g.gridview.width();
                g.gridview2.css({
                    width: gridViewWidth - gridView1Width
                });
                if(gridView1Width>0)
                {
                    g.gridview1.css({
                        position:"absolute",
                        top:"0px",
                        left:"0px"
                    }).show();
                    g.gridview2.css({
                        position:"absolute",
                        top:"0px"
                    });
                }
            }
            else{
                var gridView1Width = g.gridview1.width();
                var gridViewWidth = g.gridview.width();
                if(gridView1Width>0)
                {
                    g.gridview1.hide();
                    g.gridview2.css({
                        position:"absolute",
                        left:"0px",
                        width: gridViewWidth
                    });
                }
            }

            g.trigger('SysGridHeightChanged');
        },
        _calculateGridBodyHeight: function (h) {
            var g = this, p = this.options;
            if (typeof h == "string" && h.indexOf('%') > 0) {
                if (p.inWindow)
                    h = $(window).height() * parseInt(h) * 0.01;
                else
                    h = g.grid.parent().height() * parseInt(h) * 0.01;
            }
            if (p.title) h -= 24;
            /*** 隐藏分页 高度BUG修复 add by hzp at20160121 **/
            if (p.usePager && (p.pagerRender || !p.scrollToPage)) h -= g.toolbar.outerHeight();
            /******************************/
            if (p.totalRender) h -= 25;
            if (p.toolbar) h -= g.topbar.outerHeight();
            /** 列表高度计算bug修改 **/
            var gridHeaderHeight = (p.headerRowHeight+1) * (g._columnMaxLevel - 1) + p.headerRowHeight + 1;
            /***********************/
            h -= (gridHeaderHeight || 0);
            return h;
        },
        getColumns: function (columnLevel) {
            var g = this, p = this.options;
            var columns = [];
            for (var id in g._columns) {
                var col = g._columns[id];

                /********* 字典列翻译 ***********/
                if (col['dict']) {
                    var dictName = col.dictName;
                    //提前加载字典
                    $.ehrDict.getDictData(dictName, col.dictType, col.dictWhere);
                    //渲染字典字段
                    col.render = function (row, index, data, _col) {
                        var dict = $.ehrDict.getDictData(_col.dictName, col.dictType, col.dictWhere, function (response) {
                            g.refreshColumn(_col.dictName, response);
                        });
                        dict = $.ehrDict.listToDict(dict);
                        if (dict != null) {
                            if (dict[data] != null) {
                                return dict[data].value;
                            }
                            else {
                                return data;
                            }
                        }
                        else {
                            return "";
                        }
                    }
                }
                /********************/

                if (columnLevel != undefined) {
                    if (col['__level'] == columnLevel) columns.push(col);
                }
                else {
                    if (col['__leaf']) columns.push(col);
                }
            }
            return columns;
        },
        //字典返回后刷新列值
        refreshColumn: function (dictName, dict) {
            try {
                var me = this;
                for (var i = 0; i < me.columns.length; i++) {
                    var col = me.columns[i];
                    if (col.dict && col.dictName == dictName) {
                        var colName = col.columnname;
                        $.each($.find("td[id$='|" + col.__id + "']", me.gridbody[0]), function (index, obj) {
                            var code = me.rows[index][colName];
                            var cell = $.find("div.l-grid-row-cell-inner", obj)[0];
                            if (dict[code] != null) {
                                var val = dict[code].value;
                                if (val != undefined && val != null) {
                                    $(cell).html(val);
                                }
                            }
                            else {
                                $(cell).html(code);
                            }
                        });
                    }
                }

            }
            catch (e) {
                return;
            }
        },
        queryByText: function (filedName, text) {
            var data = this.data.detailModelList;
            for (var i = 0; i < data.length; i++) {
                var obj=JSON.stringify(data[i]);
                var r = eval("("+obj+"." + filedName+")");
                if (r.indexOf(text) >= 0) {
                    this.select(data[i]);
                    break;
                }
            }
        }
    });

    //重写树函数 add by hzp at 20160107
    $.extend($.ligerDefaults.Tree, {
        checkbox:false,
        parentIcon:false,
        childIcon:false,
        treeLine:false,
        nodeWidth:180
    });
    $.extend($.ligerui.controls.Tree.prototype, {
        _upadteTreeWidth: function ()
        {
            var g = this, p = this.options;
            var treeWidth = g.maxOutlineLevel * 22;
            if (p.checkbox) treeWidth += 22;
            if (p.parentIcon || p.childIcon) treeWidth += 22;
            treeWidth += p.nodeWidth;
            treeWidth = p.adjustToWidth? $(g.element).width(): treeWidth; // TODO [代码片段001][修复树宽度自适应问题][yezehua]
            g.tree.width(treeWidth);
        },
        getDataByID: function (id) {
            var g = this, p = this.options;
            var data = null;

            if (g.data && g.data.length) {
                return find(g.data);
            }

            function find(items) {
                for (var i = 0; i < items.length; i++) {
                    var dataItem = items[i];
                    if (dataItem[p.idFieldName] == id) return dataItem;
                    if (dataItem.children && dataItem.children.length) {
                        /*** BUG修复 ***/
                        var pre = find(dataItem.children);
                        if (pre != null) return pre;
                        /*************/
                    }
                }
                return null;
            }


            $("li", g.tree).each(function () {
                if (data) return;
                var treeitem = $(this);
                var treedataindex = parseInt(treeitem.attr("treedataindex"));
                var treenodedata = g._getDataNodeByTreeDataIndex(g.data, treedataindex);
                if (treenodedata[p.idFieldName].toString() == id.toString()) {
                    data = treenodedata;
                }
            });
            return data;
        },
        /**
         * 扩展方法1：
         * queryByText: 根据名字找出树的节点，并且打开节点
         */
        queryByText: function (text) {
            var $g = this, p = this.options;
            var nodeText = $("span", $g.tree);
            for (var i = 0; i < nodeText.length; i++) {
                if ($(nodeText[i]).text().indexOf(text) >= 0) {
                    var id = $(nodeText[i]).closest("li").attr("id");
                    $g.expandNode(id);
                    $g.selectNode(id);
                    break;
                }
            }
        },

        queryByTextInRe: function (text) {
            var $g = this, p = this.options;
            //先清除颜色
            var nodeText = $("span", $g.tree);
            for (var j = 0; j < nodeText.length;j++) {
                $(nodeText[j]).removeAttr('style');
                $(nodeText[j]).closest("div").removeClass("l-selected");
            }
            for (var i = 0; i < nodeText.length; i++) {
                if ($(nodeText[i]).text().indexOf(text) >= 0) {
                    var id = $(nodeText[i]).closest("li").attr("id");

                    $g.expandNode(id);
                    // $g.selectNode(id);
                    $(nodeText[i]).attr('style','color:#3194d5');
                }
            }
        },
        /**
         * expandNode:根据id打开节点
         * @param id
         */
        expandNode: function (id) {
            var $li = $("#" + id, this.tree).closest("li");
            var outlinelevel = $li.attr("outlinelevel");
            for (var j = 0; j < outlinelevel; j++) {
                if (j == 0) {
                    $li.parent().parent().children(".l-body").children(".l-expandable-close").removeClass("l-expandable-close").addClass("l-expandable-open");
                    $li = $li.parent().show();
                } else {
                    $li.parent().children(".l-body").children(".l-expandable-close").removeClass("l-expandable-close").addClass("l-expandable-open");
                    $li = $li.parent().parent().show();
                }
            }
        },
        /**
         * 扩展方法2：子节点是否全选
         * @param treenodedata
         * @returns {boolean}
         */
        isIncomplete: function (treenodedata)
        {
            var str = JSON.stringify(treenodedata.children);
            return (str.indexOf('"ischecked":null')!=-1 || str.indexOf('"ischecked":false')!=-1)
                && str.indexOf('"ischecked":true')!=-1;
        },
        //根据data生成最终完整的tree html
        _getTreeHTMLByData: function (data, outlineLevel, isLast, isExpand)
        {
            var g = this, p = this.options;
            if (g.maxOutlineLevel < outlineLevel)
                g.maxOutlineLevel = outlineLevel;
            isLast = isLast || [];
            outlineLevel = outlineLevel || 1;
            var treehtmlarr = [];
            if (!isExpand) treehtmlarr.push('<ul class="l-children" style="display:none">');
            else treehtmlarr.push("<ul class='l-children'>");
            for (var i = 0; i < data.length; i++)
            {
                var o = data[i];
                var isFirst = i == 0;
                var isLastCurrent = i == data.length - 1;
                var delay = g._getDelay(o, outlineLevel);
                var isExpandCurrent = delay ? false : g._isExpand(o, outlineLevel);

                treehtmlarr.push('<li ');
                if (o.treedataindex != undefined)
                    treehtmlarr.push('treedataindex="' + o.treedataindex + '" ');
                if (isExpandCurrent)
                    treehtmlarr.push('isexpand=' + o.isexpand + ' ');
                treehtmlarr.push('outlinelevel=' + outlineLevel + ' ');
                //增加属性支持
                for (var j = 0; j < g.sysAttribute.length; j++)
                {
                    if ($(this).attr(g.sysAttribute[j]))
                        data[dataindex][g.sysAttribute[j]] = $(this).attr(g.sysAttribute[j]);
                }
                for (var j = 0; j < p.attribute.length; j++)
                {
                    if (o[p.attribute[j]])
                        treehtmlarr.push(p.attribute[j] + '="' + o[p.attribute[j]] + '" ');
                }

                //css class
                treehtmlarr.push('class="');
                isFirst && treehtmlarr.push('l-first ');
                isLastCurrent && treehtmlarr.push('l-last ');
                isFirst && isLastCurrent && treehtmlarr.push('l-onlychild ');
                treehtmlarr.push('"');
                treehtmlarr.push('>');
                treehtmlarr.push('<div class="l-body');
                if (p.selectable && p.selectable(o) == false)
                {
                    treehtmlarr.push(' l-unselectable');
                }
                treehtmlarr.push('">');
                for (var k = 0; k <= outlineLevel - 2; k++)
                {
                    if (isLast[k]) treehtmlarr.push('<div class="l-box"></div>');
                    else treehtmlarr.push('<div class="l-box l-line"></div>');
                }
                if (g.hasChildren(o))
                {
                    if (isExpandCurrent) treehtmlarr.push('<div class="l-box l-expandable-open"></div>');
                    else treehtmlarr.push('<div class="l-box l-expandable-close"></div>');
                    if (p.checkbox)
                    {
                        if (o.ischecked)
                            treehtmlarr.push('<div class="l-box l-checkbox l-checkbox-checked"></div>');
                        // TODO add by lincl start
                        else if(g.isIncomplete(o))
                            treehtmlarr.push('<div class="l-box l-checkbox l-checkbox-incomplete"></div>');
                        // add by lincl end
                        else
                            treehtmlarr.push('<div class="l-box l-checkbox l-checkbox-unchecked"></div>');
                    }
                    if (p.parentIcon)
                    {
                        //node icon
                        treehtmlarr.push('<div class="l-box l-tree-icon ');
                        treehtmlarr.push(g._getParentNodeClassName(isExpandCurrent ? true : false) + " ");
                        if (p.iconFieldName && o[p.iconFieldName])
                            treehtmlarr.push('l-tree-icon-none');
                        treehtmlarr.push('">');
                        if (p.iconFieldName && o[p.iconFieldName])
                            treehtmlarr.push('<img src="' + o[p.iconFieldName] + '" />');
                        treehtmlarr.push('</div>');
                    }
                }
                else
                {
                    if (isLastCurrent) treehtmlarr.push('<div class="l-box l-note-last"></div>');
                    else treehtmlarr.push('<div class="l-box l-note"></div>');
                    if (p.checkbox)
                    {
                        if (o.ischecked)
                            treehtmlarr.push('<div class="l-box l-checkbox l-checkbox-checked"></div>');
                        else
                            treehtmlarr.push('<div class="l-box l-checkbox l-checkbox-unchecked"></div>');
                    }
                    if (p.childIcon)
                    {
                        //node icon
                        treehtmlarr.push('<div class="l-box l-tree-icon ');
                        treehtmlarr.push(g._getChildNodeClassName() + " ");
                        if (p.iconFieldName && o[p.iconFieldName])
                            treehtmlarr.push('l-tree-icon-none');
                        treehtmlarr.push('">');
                        if (p.iconFieldName && o[p.iconFieldName])
                            treehtmlarr.push('<img src="' + o[p.iconFieldName] + '" />');
                        treehtmlarr.push('</div>');
                    }
                }
                if (p.render)
                {
                    //treehtmlarr.push('<span>' + p.render(o, o[p.textFieldName]) + '</span>');
                    treehtmlarr.push('<span title="'+ o[p.textFieldName] +'">' + p.render(o, o[p.textFieldName]) + '</span>');
                } else
                {
                    // treehtmlarr.push('<span>' + o[p.textFieldName] + '</span>');
                    treehtmlarr.push('<span title="'+ o[p.textFieldName] +'">' + o[p.textFieldName] + '</span>');
                }
                treehtmlarr.push('</div>');
                if (g.hasChildren(o))
                {
                    var isLastNew = [];
                    for (var k = 0; k < isLast.length; k++)
                    {
                        isLastNew.push(isLast[k]);
                    }
                    isLastNew.push(isLastCurrent);
                    if (delay)
                    {
                        if (delay == true)
                        {
                            g.toggleNodeCallbacks.push({
                                data: o,
                                callback: function (dom, o)
                                {
                                    var content = g._getTreeHTMLByData(o.children, outlineLevel + 1, isLastNew, isExpandCurrent).join('');
                                    $(dom).append(content);
                                    $(">.l-children .l-body", dom).hover(function ()
                                    {
                                        $(this).addClass("l-over");
                                    }, function ()
                                    {
                                        $(this).removeClass("l-over");
                                    });
                                    g._removeToggleNodeCallback(o);
                                }
                            });
                        }
                        else if (delay.url)
                        {
                            (function (o, url, parms)
                            {
                                g.toggleNodeCallbacks.push({
                                    data: o,
                                    callback: function (dom, o)
                                    {
                                        g.loadData(dom, url, parms, {
                                            showLoading: function ()
                                            {
                                                $("div.l-expandable-close:first", dom).addClass("l-box-loading");
                                            },
                                            hideLoading: function ()
                                            {
                                                $("div.l-box-loading:first", dom).removeClass("l-box-loading");
                                            }
                                        });
                                        g._removeToggleNodeCallback(o);
                                    }
                                });
                            })(o, delay.url, delay.parms);
                        }
                    }
                    else
                    {
                        treehtmlarr.push(g._getTreeHTMLByData(o.children, outlineLevel + 1, isLastNew, isExpandCurrent).join(''));
                    }

                }
                treehtmlarr.push('</li>');
            }
            treehtmlarr.push("</ul>");
            return treehtmlarr;

        }
    });

    //重写radio方法 add by hzp at 20160107
    $.extend($.ligerui.controls.Radio.prototype, {
        setValue: function (val) {
            var name = this.element.name;
            $('input[name="' + name + '"]').each(function () {
                var typeObj = $(this).closest('.l-radio-wrapper').find('a.l-radio');
                if (this.value == val) {
                    typeObj.addClass("l-radio-checked");
                    this.checked = true;
                }
                else {
                    typeObj.removeClass("l-radio-checked");
                    this.checked = false;
                }
            });
        },
        getValue: function () {
            var name = this.element.name;
            var re = "";
            $('input[name="' + name + '"]').each(function () {
                if (this.checked) {
                    re = this.value;
                    return;
                }
            });
            return re;
        }
    });

    //重写CheckBox方法 add by hzp at 20160107
    $.extend($.ligerui.controls.CheckBox.prototype, {
        setValue: function (val) {
            var name = this.element.name;


            var vals = null;
            if (val != null && val.length > 0) {
                vals = val.split(',');
            }
            $('input[name="' + name + '"]').each(function () {
                var typeObj = $(this).closest('.l-checkbox-wrapper').find('a.l-checkbox');

                var isChecked = false;
                if (vals != null) {
                    for (var i = 0; i < vals.length; i++) {
                        if (this.value == vals[i]) {
                            isChecked = true;
                        }
                    }
                }

                if (isChecked) {
                    typeObj.addClass("l-checkbox-checked");
                    this.checked = true;
                }
                else {
                    typeObj.removeClass("l-checkbox-checked");
                    this.checked = false;
                }
            });
        },
        getValue: function () {
            var name = this.element.name;
            var re = "";
            $('input[name="' + name + '"]').each(function () {
                if (this.checked) {
                    re += this.value + ",";
                }
            });
            if (re.length > 0) {
                re = re.substr(0, re.length - 1);
            }
            return re;
        }
    });

    //重写时间控件方法 add by hzp at 20160107
    $.extend($.ligerDefaults.DateEditor,{
        format: "yyyy-MM-dd hh:mm:ss"
    });
    $.extend($.ligerui.controls.DateEditor.prototype, {
        getYear: function () {
            return this.currentDate.year;
        },
        getMonth: function () {
            return this.currentDate.month;
        },
        getDate: function () {
            return this.currentDate.date;
        },
        getHour: function () {
            return this.currentDate.hour;
        },
        getMinute: function () {
            return this.currentDate.minute;
        },
        _render: function ()
        {
            var g = this, p = this.options;
            /**** 增加秒显示 *****/
            if (!p.showTime && p.format.indexOf(" hh:mm:ss") > -1)
                p.format = p.format.replace(" hh:mm:ss", "");
            /********************/
            if (this.element.tagName.toLowerCase() != "input" || this.element.type != "text")
                return;
            g.inputText = $(this.element);
            if (!g.inputText.hasClass("l-text-field"))
                g.inputText.addClass("l-text-field");
            g.link = $('<div class="l-trigger"><div class="l-trigger-icon"></div></div>');
            g.text = g.inputText.wrap('<div class="l-text l-text-date"></div>').parent();
            g.text.append('<div class="l-text-l"></div><div class="l-text-r"></div>');
            g.text.append(g.link);
            //添加个包裹，
            g.textwrapper = g.text.wrap('<div class="l-text-wrapper"></div>').parent();
            var dateeditorHTML = "";
            dateeditorHTML += "<div class='l-box-dateeditor' style='display:none'>";
            dateeditorHTML += "    <div class='l-box-dateeditor-header'>";
            dateeditorHTML += "        <div class='l-box-dateeditor-header-btn l-box-dateeditor-header-prevyear'><span></span></div>";
            dateeditorHTML += "        <div class='l-box-dateeditor-header-btn l-box-dateeditor-header-prevmonth'><span></span></div>";
            dateeditorHTML += "        <div class='l-box-dateeditor-header-text'><a class='l-box-dateeditor-header-month'></a> , <a  class='l-box-dateeditor-header-year'></a></div>";
            dateeditorHTML += "        <div class='l-box-dateeditor-header-btn l-box-dateeditor-header-nextmonth'><span></span></div>";
            dateeditorHTML += "        <div class='l-box-dateeditor-header-btn l-box-dateeditor-header-nextyear'><span></span></div>";
            dateeditorHTML += "    </div>";
            dateeditorHTML += "    <div class='l-box-dateeditor-body'>";
            dateeditorHTML += "        <table cellpadding='0' cellspacing='0' border='0' class='l-box-dateeditor-calendar'>";
            dateeditorHTML += "            <thead>";
            dateeditorHTML += "                <tr><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td></tr>";
            dateeditorHTML += "            </thead>";
            dateeditorHTML += "            <tbody>";
            dateeditorHTML += "                <tr class='l-first'><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td></tr><tr><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td></tr><tr><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td></tr><tr><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td></tr><tr><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td></tr><tr><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td><td align='center'></td></tr>";
            dateeditorHTML += "            </tbody>";
            dateeditorHTML += "        </table>";
            dateeditorHTML += "        <ul class='l-box-dateeditor-monthselector'><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>";
            dateeditorHTML += "        <ul class='l-box-dateeditor-yearselector'><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>";
            dateeditorHTML += "        <ul class='l-box-dateeditor-hourselector'><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>";
            dateeditorHTML += "        <ul class='l-box-dateeditor-minuteselector'><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>";
            dateeditorHTML += "    </div>";
            dateeditorHTML += "    <div class='l-box-dateeditor-toolbar'>";
            /**************** 添加“时间：”标识 add by hzp at 20160217 *********/
            dateeditorHTML += "        <div class='l-box-dateeditor-time'>时间：</div>";
            /********************************************************/
            dateeditorHTML += "        <div class='l-button l-button-today'></div>";
            dateeditorHTML += "        <div class='l-button l-button-close'></div>";
            dateeditorHTML += "        <div class='l-clear'></div>";
            dateeditorHTML += "    </div>";
            dateeditorHTML += "</div>";
            g.dateeditor = $(dateeditorHTML);
            if (p.absolute)
                g.dateeditor.appendTo('body').addClass("l-box-dateeditor-absolute");
            else
                g.textwrapper.append(g.dateeditor);
            g.header = $(".l-box-dateeditor-header", g.dateeditor);
            g.body = $(".l-box-dateeditor-body", g.dateeditor);
            g.toolbar = $(".l-box-dateeditor-toolbar", g.dateeditor);

            g.body.thead = $("thead", g.body);
            g.body.tbody = $("tbody", g.body);
            g.body.monthselector = $(".l-box-dateeditor-monthselector", g.body);
            g.body.yearselector = $(".l-box-dateeditor-yearselector", g.body);
            g.body.hourselector = $(".l-box-dateeditor-hourselector", g.body);
            g.body.minuteselector = $(".l-box-dateeditor-minuteselector", g.body);

            g.toolbar.time = $(".l-box-dateeditor-time", g.toolbar);
            g.toolbar.time.hour = $("<a></a>");
            g.toolbar.time.minute = $("<a></a>");
            g.buttons = {
                btnPrevYear: $(".l-box-dateeditor-header-prevyear", g.header),
                btnNextYear: $(".l-box-dateeditor-header-nextyear", g.header),
                btnPrevMonth: $(".l-box-dateeditor-header-prevmonth", g.header),
                btnNextMonth: $(".l-box-dateeditor-header-nextmonth", g.header),
                btnYear: $(".l-box-dateeditor-header-year", g.header),
                btnMonth: $(".l-box-dateeditor-header-month", g.header),
                btnToday: $(".l-button-today", g.toolbar),
                btnClose: $(".l-button-close", g.toolbar)
            };
            var nowDate = new Date();
            g.now = {
                year: nowDate.getFullYear(),
                month: nowDate.getMonth() + 1, //注意这里
                day: nowDate.getDay(),
                date: nowDate.getDate(),
                hour: nowDate.getHours(),
                minute: nowDate.getMinutes()
            };
            //当前的时间
            g.currentDate = {
                year: nowDate.getFullYear(),
                month: nowDate.getMonth() + 1,
                day: nowDate.getDay(),
                date: nowDate.getDate(),
                hour: nowDate.getHours(),
                minute: nowDate.getMinutes()
            };
            //选择的时间
            g.selectedDate = null;
            //使用的时间
            g.usedDate = null;



            //初始化数据
            //设置周日至周六
            $("td", g.body.thead).each(function (i, td)
            {
                $(td).html(p.dayMessage[i]);
            });
            //设置一月到十一二月
            $("li", g.body.monthselector).each(function (i, li)
            {
                $(li).html(p.monthMessage[i]);
            });
            //设置按钮
            g.buttons.btnToday.html(p.todayMessage);
            g.buttons.btnClose.html(p.closeMessage);
            //设置时间
            if (p.showTime)
            {
                g.toolbar.time.show();
                g.toolbar.time.append(g.toolbar.time.hour).append(":").append(g.toolbar.time.minute);

                $("li", g.body.hourselector).each(function (i, item)
                {
                    var str = i;
                    if (i < 10) str = "0" + i.toString();
                    $(this).html(str);
                });
                $("li", g.body.minuteselector).each(function (i, item)
                {
                    var str = i;
                    if (i < 10) str = "0" + i.toString();
                    $(this).html(str);
                });
            }
            //设置主体
            g.bulidContent();
            //初始化
            //初始值
            if (p.initValue)
            {
                g.inputText.val(p.initValue);
            }
            if (g.inputText.val() != "")
            {
                g.onTextChange();
            }
            /**************
             **bulid evens**
             *************/
            g.dateeditor.hover(null, function (e)
            {
                if (g.dateeditor.is(":visible") && !g.editorToggling)
                {
                    g.toggleDateEditor(true);
                }
            });
            //toggle even
            g.link.hover(function ()
            {
                if (p.disabled) return;
                this.className = "l-trigger-hover";
            }, function ()
            {
                if (p.disabled) return;
                this.className = "l-trigger";
            }).mousedown(function ()
            {
                if (p.disabled) return;
                this.className = "l-trigger-pressed";
            }).mouseup(function ()
            {
                if (p.disabled) return;
                this.className = "l-trigger-hover";
            }).click(function ()
            {
                if (p.disabled) return;
                g.bulidContent();
                g.toggleDateEditor(g.dateeditor.is(":visible"));
            });
            //不可用属性时处理
            if (p.disabled)
            {
                g.inputText.attr("readonly", "readonly");
                g.text.addClass('l-text-disabled');
            }
            g.buttons.btnClose.click(function ()
            {
                g.toggleDateEditor(true);
            });
            //日期 点击
            $("td", g.body.tbody).hover(function ()
            {
                if ($(this).hasClass("l-box-dateeditor-today")) return;
                $(this).addClass("l-box-dateeditor-over");
            }, function ()
            {
                $(this).removeClass("l-box-dateeditor-over");
            }).click(function ()
            {
                $(".l-box-dateeditor-selected", g.body.tbody).removeClass("l-box-dateeditor-selected");
                if (!$(this).hasClass("l-box-dateeditor-today"))
                    $(this).addClass("l-box-dateeditor-selected");
                g.currentDate.date = parseInt($(this).html());
                g.currentDate.day = new Date(g.currentDate.year, g.currentDate.month - 1, 1).getDay();
                if ($(this).hasClass("l-box-dateeditor-out"))
                {
                    if ($("tr", g.body.tbody).index($(this).parent()) == 0)
                    {
                        if (--g.currentDate.month == 0)
                        {
                            g.currentDate.month = 12;
                            g.currentDate.year--;
                        }
                    } else
                    {
                        if (++g.currentDate.month == 13)
                        {
                            g.currentDate.month = 1;
                            g.currentDate.year++;
                        }
                    }
                }
                g.selectedDate = {
                    year: g.currentDate.year,
                    month: g.currentDate.month,
                    date: g.currentDate.date
                };
                g.showDate();
                g.editorToggling = true;
                g.dateeditor.slideToggle('fast', function ()
                {
                    g.editorToggling = false;
                });
            });

            $(".l-box-dateeditor-header-btn", g.header).hover(function ()
            {
                $(this).addClass("l-box-dateeditor-header-btn-over");
            }, function ()
            {
                $(this).removeClass("l-box-dateeditor-header-btn-over");
            });
            //选择年份
            g.buttons.btnYear.click(function ()
            {
                //build year list
                if (!g.body.yearselector.is(":visible"))
                {
                    $("li", g.body.yearselector).each(function (i, item)
                    {
                        var currentYear = g.currentDate.year + (i - 4);
                        if (currentYear == g.currentDate.year)
                            $(this).addClass("l-selected");
                        else
                            $(this).removeClass("l-selected");
                        $(this).html(currentYear);
                    });
                }

                g.body.yearselector.slideToggle();
            });
            g.body.yearselector.hover(function () { }, function ()
            {
                $(this).slideUp();
            });
            $("li", g.body.yearselector).click(function ()
            {
                g.currentDate.year = parseInt($(this).html());
                g.body.yearselector.slideToggle();
                g.bulidContent();
            });
            //select month
            g.buttons.btnMonth.click(function ()
            {
                $("li", g.body.monthselector).each(function (i, item)
                {
                    //add selected style
                    if (g.currentDate.month == i + 1)
                        $(this).addClass("l-selected");
                    else
                        $(this).removeClass("l-selected");
                });
                g.body.monthselector.slideToggle();
            });
            g.body.monthselector.hover(function () { }, function ()
            {
                $(this).slideUp("fast");
            });
            $("li", g.body.monthselector).click(function ()
            {
                var index = $("li", g.body.monthselector).index(this);
                g.currentDate.month = index + 1;
                g.body.monthselector.slideToggle();
                g.bulidContent();
            });

            //选择小时
            g.toolbar.time.hour.click(function ()
            {
                $("li", g.body.hourselector).each(function (i, item)
                {
                    //add selected style
                    if (g.currentDate.hour == i)
                        $(this).addClass("l-selected");
                    else
                        $(this).removeClass("l-selected");
                });
                g.body.hourselector.slideToggle();
            });
            g.body.hourselector.hover(function () { }, function ()
            {
                $(this).slideUp("fast");
            });
            $("li", g.body.hourselector).click(function ()
            {
                var index = $("li", g.body.hourselector).index(this);
                g.currentDate.hour = index;
                g.body.hourselector.slideToggle();
                g.bulidContent();
                g.showDate();
            });
            //选择分钟
            g.toolbar.time.minute.click(function ()
            {
                $("li", g.body.minuteselector).each(function (i, item)
                {
                    //add selected style
                    if (g.currentDate.minute == i)
                        $(this).addClass("l-selected");
                    else
                        $(this).removeClass("l-selected");
                });
                g.body.minuteselector.slideToggle("fast", function ()
                {
                    var index = $("li", this).index($('li.l-selected', this));
                    if (index > 29)
                    {
                        var offSet = ($('li.l-selected', this).offset().top - $(this).offset().top);
                        $(this).animate({ scrollTop: offSet });
                    }
                });
            });
            g.body.minuteselector.hover(function () { }, function ()
            {
                $(this).slideUp("fast");
            });
            $("li", g.body.minuteselector).click(function ()
            {
                var index = $("li", g.body.minuteselector).index(this);
                g.currentDate.minute = index;
                g.body.minuteselector.slideToggle("fast");
                g.bulidContent();
                g.showDate();
            });

            //上个月
            g.buttons.btnPrevMonth.click(function ()
            {
                if (--g.currentDate.month == 0)
                {
                    g.currentDate.month = 12;
                    g.currentDate.year--;
                }
                g.bulidContent();
            });
            //下个月
            g.buttons.btnNextMonth.click(function ()
            {
                if (++g.currentDate.month == 13)
                {
                    g.currentDate.month = 1;
                    g.currentDate.year++;
                }
                g.bulidContent();
            });
            //上一年
            g.buttons.btnPrevYear.click(function ()
            {
                g.currentDate.year--;
                g.bulidContent();
            });
            //下一年
            g.buttons.btnNextYear.click(function ()
            {
                g.currentDate.year++;
                g.bulidContent();
            });
            //今天
            g.buttons.btnToday.click(function ()
            {
                g.currentDate = {
                    year: g.now.year,
                    month: g.now.month,
                    day: g.now.day,
                    date: g.now.date
                };
                g.selectedDate = {
                    year: g.now.year,
                    month: g.now.month,
                    day: g.now.day,
                    date: g.now.date
                };
                g.showDate();
                g.dateeditor.slideToggle("fast");
            });
            //文本框
            g.inputText.change(function ()
            {
                g.onTextChange();
            }).blur(function ()
            {
                g.text.removeClass("l-text-focus");
            }).focus(function ()
            {
                g.text.addClass("l-text-focus");
            });
            g.text.hover(function ()
            {
                g.text.addClass("l-text-over");
            }, function ()
            {
                g.text.removeClass("l-text-over");
            });
            //LEABEL 支持
            if (p.label)
            {
                g.labelwrapper = g.textwrapper.wrap('<div class="l-labeltext"></div>').parent();
                g.labelwrapper.prepend('<div class="l-text-label" style="float:left;display:inline;">' + p.label + ':&nbsp</div>');
                g.textwrapper.css('float', 'left');
                if (!p.labelWidth)
                {
                    p.labelWidth = $('.l-text-label', g.labelwrapper).outerWidth();
                } else
                {
                    $('.l-text-label', g.labelwrapper).outerWidth(p.labelWidth);
                }
                $('.l-text-label', g.labelwrapper).width(p.labelWidth);
                $('.l-text-label', g.labelwrapper).height(g.text.height());
                g.labelwrapper.append('<br style="clear:both;" />');
                if (p.labelAlign)
                {
                    $('.l-text-label', g.labelwrapper).css('text-align', p.labelAlign);
                }
                g.textwrapper.css({ display: 'inline' });
                g.labelwrapper.width(g.text.outerWidth() + p.labelWidth + 2);
            }

            g.set(p);
            //增加鼠标在日期控件外点击隐藏日期选择框功能
            $(document).bind("click.dateeditor", function (e)
            {
                if (g.dateeditor.is(":visible") && $((e.target || e.srcElement)).closest( ".l-box-dateeditor, .l-text-date" ).length == 0)
                {
                    g.toggleDateEditor(true);
                }
            });
        },
        updateSelectBoxPosition: function ()
        {
            var g = this, p = this.options;
            if (p.absolute)
            {
                var contentHeight = $(document).height();
                /** 定位BUG修复 add by hzp at 20160217 ***********/
                if (Number(g.text.offset().top + 1 + g.text.outerHeight() + g.dateeditor.height()) > contentHeight
                    && contentHeight > Number(g.dateeditor.height() + 1))
                {
                    //若下拉框大小超过当前document下边框,且当前document上留白大于下拉内容高度,下拉内容向上展现
                    g.dateeditor.css({ left: g.text.offset().left, top: g.text.offset().top + 1 - g.dateeditor.height() });
                } else
                {
                    g.dateeditor.css({ left: g.text.offset().left, top: g.text.offset().top - 1 + g.text.outerHeight() });
                }
                /********************************************/
            }
            else
            {
                if (g.text.offset().top + 4 > g.dateeditor.height() && g.text.offset().top + g.dateeditor.height() + textHeight + 4 - $(window).scrollTop() > $(window).height())
                {
                    g.dateeditor.css("marginTop", -1 * (g.dateeditor.height() + textHeight + 5));
                    g.showOnTop = true;
                }
                else
                {
                    g.showOnTop = false;
                }
            }
        },
        getValue: function(){
            return $(this.element).val();
        },
        setValue: function (value)
        {
            var g = this;
            if (!value) g.inputText.val('');
            if (typeof value == "string")
            {
                if (/^\/Date/.test(value))
                {
                    value = value.replace(/^\//, "new ").replace(/\/$/, "");
                    eval("value = " + value);
                }
                /******* 时间格式BUG ***********/
                else{
                    if(value.length > g.options.format.length)
                    {
                        value = value.substr(0,g.options.format.length);
                    }
                }

                g.inputText.val(value);
                g.usedDate = value;
                /******* 时间格式BUG ***********/
                g.onTextChange();
                /******************/
            }
            if (typeof value == "object")
            {
                if (value instanceof Date)
                {
                    g.inputText.val(g.getFormatDate(value));
                    g.onTextChange();
                }
            }
        }
    });

    //重写弹窗控件 add by hzp at 20160217
    $.extend($.ligerui.controls.Dialog.prototype,{
        _setImage: function ()
        {
            var g = this, p = this.options;
            if (p.type)
            {
                /************* 修改弹出对话框样式 *******************************/
                var alertCss = { padding:"10px",textAlign:"center",fontWeight:"bolder",fontSize:"14px",lineHeight:"24px"};
                g.dialog.body.css({width:300});
                /*******************************************************/
                if (p.type == 'success' || p.type == 'donne' || p.type == 'ok')
                {
                    $(".l-dialog-image", g.dialog).addClass("l-dialog-image-donne").show();
                    g.dialog.content.css(alertCss);
                }
                else if (p.type == 'error')
                {
                    $(".l-dialog-image", g.dialog).addClass("l-dialog-image-error").show();
                    g.dialog.content.css(alertCss);
                }
                else if (p.type == 'warn')
                {
                    $(".l-dialog-image", g.dialog).addClass("l-dialog-image-warn").show();
                    g.dialog.content.css(alertCss);
                }
                else if (p.type == 'question')
                {
                    $(".l-dialog-image", g.dialog).addClass("l-dialog-image-question").show();
                    g.dialog.content.css(alertCss);
                }
            }
        }
    });

    //重写layout控件 add by hzp at 20160229
    $.extend($.ligerui.controls.Layout.prototype,{
        _render: function ()
        {
            var g = this, p = this.options;
            g.layout = $(this.element);
            g.layout.addClass("l-layout");
            g.width = g.layout.width();
            //top
            if ($("> div[position=top]", g.layout).length > 0)
            {
                g.top = $("> div[position=top]", g.layout).wrap('<div class="l-layout-top" style="top:0px;"></div>').parent();
                g.top.content = $("> div[position=top]", g.top);
                if (!g.top.content.hasClass("l-layout-content"))
                    g.top.content.addClass("l-layout-content");
                g.topHeight = p.topHeight;
                if (g.topHeight)
                {
                    g.top.height(g.topHeight);
                }
            }
            //bottom
            if ($("> div[position=bottom]", g.layout).length > 0)
            {
                g.bottom = $("> div[position=bottom]", g.layout).wrap('<div class="l-layout-bottom"></div>').parent();
                g.bottom.content = $("> div[position=bottom]", g.bottom);
                if (!g.bottom.content.hasClass("l-layout-content"))
                    g.bottom.content.addClass("l-layout-content");

                g.bottomHeight = p.bottomHeight;
                if (g.bottomHeight)
                {
                    g.bottom.height(g.bottomHeight);
                }
                //set title
                var bottomtitle = g.bottom.content.attr("title");
                if (bottomtitle)
                {
                    g.bottom.header = $('<div class="l-layout-header"></div>');
                    g.bottom.prepend(g.bottom.header);
                    g.bottom.header.html(bottomtitle);
                    g.bottom.content.attr("title", "");
                }
            }
            //left
            if ($("> div[position=left]", g.layout).length > 0)
            {
                g.left = $("> div[position=left]", g.layout).wrap('<div class="l-layout-left" style="left:0px;"></div>').parent();
                g.left.header = $('<div class="l-layout-header"><div class="l-layout-header-toggle"></div><div class="l-layout-header-inner"></div></div>');
                g.left.header.toggle = $(".l-layout-header-toggle", g.left.header);
                g.left.content = $("> div[position=left]", g.left);
                if (!g.left.content.hasClass("l-layout-content"))
                    g.left.content.addClass("l-layout-content");
                if (!p.allowLeftCollapse) $(".l-layout-header-toggle", g.left.header).remove();
                //set title
                var lefttitle = g.left.content.attr("title");
                if (lefttitle)
                {
                    g.left.prepend(g.left.header);
                    g.left.content.attr("title", "");
                    $(".l-layout-header-inner", g.left.header).html(lefttitle);
                }
                //set title
                if (g.left.content.attr("hidetitle"))
                {
                    g.left.content.attr("title", "");
                    g.left.header.remove();
                }
                //set width
                g.leftWidth = p.leftWidth;
                if (g.leftWidth)
                    g.left.width(g.leftWidth);
            }
            //center
            if ($("> div[position=center]", g.layout).length > 0)
            {
                g.center = $("> div[position=center]", g.layout).wrap('<div class="l-layout-center" ></div>').parent();
                g.center.content = $("> div[position=center]", g.center);
                g.center.content.addClass("l-layout-content");
                //set title
                var centertitle = g.center.content.attr("title");
                if (centertitle)
                {
                    g.center.content.attr("title", "");
                    g.center.header = $('<div class="l-layout-header"></div>');
                    g.center.prepend(g.center.header);
                    g.center.header.html(centertitle);
                }
                if (g.center.content.attr("hidetitle"))
                {
                    g.center.content.attr("title", "");
                    g.center.header.remove();
                }
                //set width
                g.centerWidth = p.centerWidth;
                if (g.centerWidth)
                    g.center.width(g.centerWidth);

                //centerBottom
                if ($("> div[position=centerbottom]", g.layout).length > 0)
                {
                    g.centerBottom = $("> div[position=centerbottom]", g.layout).wrap('<div class="l-layout-centerbottom" ></div>').parent();
                    g.centerBottom.content = $("> div[position=centerbottom]", g.centerBottom);
                    g.centerBottom.content.addClass("l-layout-content");
                    //set title
                    var centertitle = g.centerBottom.content.attr("title");
                    if (centertitle)
                    {
                        g.centerBottom.content.attr("title", "");
                        g.centerBottom.header = $('<div class="l-layout-header"></div>');
                        g.centerBottom.prepend(g.centerBottom.header);
                        g.centerBottom.header.html(centertitle);
                    }
                    if (g.centerBottom.content.attr("hidetitle"))
                    {
                        g.centerBottom.content.attr("title", "");
                        if (g.centerBottom.header)
                        {
                            g.centerBottom.header.remove();
                        }
                    }
                    if (g.centerWidth)
                        g.centerBottom.width(g.centerWidth);
                }
            }
            //right
            if ($("> div[position=right]", g.layout).length > 0)
            {
                g.right = $("> div[position=right]", g.layout).wrap('<div class="l-layout-right"></div>').parent();

                g.right.header = $('<div class="l-layout-header"><div class="l-layout-header-toggle"></div><div class="l-layout-header-inner"></div></div>');
                g.right.prepend(g.right.header);
                g.right.header.toggle = $(".l-layout-header-toggle", g.right.header);
                if (!p.allowRightCollapse) $(".l-layout-header-toggle", g.right.header).remove();
                g.right.content = $("> div[position=right]", g.right);
                if (!g.right.content.hasClass("l-layout-content"))
                    g.right.content.addClass("l-layout-content");

                //set title
                var righttitle = g.right.content.attr("title");
                if (righttitle)
                {
                    g.right.content.attr("title", "");
                    $(".l-layout-header-inner", g.right.header).html(righttitle);
                }
                if (g.right.content.attr("hidetitle"))
                {
                    g.right.content.attr("title", "");
                    g.right.header.remove();
                }
                //set width
                g.rightWidth = p.rightWidth;
                if (g.rightWidth)
                    g.right.width(g.rightWidth);
            }
            //lock
            g.layout.lock = $("<div class='l-layout-lock'></div>");
            g.layout.append(g.layout.lock);
            //DropHandle
            g._addDropHandle();

            //Collapse
            g.isLeftCollapse = p.isLeftCollapse;
            g.isRightCollapse = p.isRightCollapse;
            g.leftCollapse = $('<div class="l-layout-collapse-left" style="display: none; "><div class="l-layout-collapse-left-toggle"></div></div>');
            g.rightCollapse = $('<div class="l-layout-collapse-right" style="display: none; "><div class="l-layout-collapse-right-toggle"></div></div>');
            g.layout.append(g.leftCollapse).append(g.rightCollapse);
            g.leftCollapse.toggle = $("> .l-layout-collapse-left-toggle", g.leftCollapse);
            g.rightCollapse.toggle = $("> .l-layout-collapse-right-toggle", g.rightCollapse);
            g._setCollapse();
            //init
            g._bulid();
            $(window).resize(function ()
            {
                g._onResize();
            });
            g.set(p);
            g.mask.height(g.layout.height());
        },
        _onResize: function ()
        {
            var g = this, p = this.options;
            var oldheight = g.layout.height();
            //set layout height
            var h = 0;
            var windowHeight = $(window).height();
            var parentHeight = null;
            if (typeof (p.height) == "string" && p.height.indexOf('%') > 0)
            {
                var layoutparent = g.layout.parent();
                if (p.inWindow || layoutparent[0].tagName.toLowerCase() == "body")
                {
                    parentHeight = windowHeight;
                    parentHeight -= parseInt($('body').css('paddingTop'));
                    parentHeight -= parseInt($('body').css('paddingBottom'));
                }
                else
                {
                    parentHeight = layoutparent.height();
                }

                h = parentHeight * parseFloat(p.height) * 0.01;
                if (p.inWindow || layoutparent[0].tagName.toLowerCase() == "body")
                    h -= (g.layout.offset().top - parseInt($('body').css('paddingTop')));

                /****** 判断是否比外层高 add by hzp at 2016-03-15 **********/
                if(layoutparent.height() >0 && h > layoutparent.height())
                {
                    var padding = layoutparent.innerHeight() - layoutparent.height();
                    var margin = layoutparent.outerHeight(true) - layoutparent.outerHeight();
                    h = layoutparent.height() - padding - margin;
                }
                /*************************************************/
            }
            else
            {
                h = parseInt(p.height);
            }
            h += p.heightDiff;
            g.layout.height(h);
            g.layoutHeight = g.layout.height();
            g.middleWidth = g.layout.width();
            g.middleHeight = g.layout.height();
            if (g.top)
            {
                g.middleHeight -= g.top.height();
                g.middleHeight -= parseInt(g.top.css('borderTopWidth'));
                g.middleHeight -= parseInt(g.top.css('borderBottomWidth'));
                g.middleHeight -= p.space;
            }
            if (g.bottom)
            {
                g.middleHeight -= g.bottom.height();
                g.middleHeight -= parseInt(g.bottom.css('borderTopWidth'));
                g.middleHeight -= parseInt(g.bottom.css('borderBottomWidth'));
                g.middleHeight -= p.space;
            }
            //specific
            g.middleHeight -= 2;

            if (g.hasBind('heightChanged') && g.layoutHeight != oldheight)
            {
                g.trigger('heightChanged', [{ layoutHeight: g.layoutHeight, diff: g.layoutHeight - oldheight, middleHeight: g.middleHeight}]);
            }

            if (g.center)
            {
                g.centerWidth = g.middleWidth;
                if (g.left)
                {
                    if (g.isLeftCollapse)
                    {
                        g.centerWidth -= g.leftCollapse.width();
                        g.centerWidth -= parseInt(g.leftCollapse.css('borderLeftWidth'));
                        g.centerWidth -= parseInt(g.leftCollapse.css('borderRightWidth'));
                        g.centerWidth -= parseInt(g.leftCollapse.css('left'));
                        g.centerWidth -= p.space;
                    }
                    else
                    {
                        g.centerWidth -= g.leftWidth;
                        g.centerWidth -= parseInt(g.left.css('borderLeftWidth'));
                        g.centerWidth -= parseInt(g.left.css('borderRightWidth'));
                        g.centerWidth -= parseInt(g.left.css('left'));
                        g.centerWidth -= p.space;
                    }
                }
                if (g.right)
                {
                    if (g.isRightCollapse)
                    {
                        g.centerWidth -= g.rightCollapse.width();
                        g.centerWidth -= parseInt(g.rightCollapse.css('borderLeftWidth'));
                        g.centerWidth -= parseInt(g.rightCollapse.css('borderRightWidth'));
                        g.centerWidth -= parseInt(g.rightCollapse.css('right'));
                        g.centerWidth -= p.space;
                    }
                    else
                    {
                        g.centerWidth -= g.rightWidth;
                        g.centerWidth -= parseInt(g.right.css('borderLeftWidth'));
                        g.centerWidth -= parseInt(g.right.css('borderRightWidth'));
                        g.centerWidth -= p.space;
                    }
                }
                g.centerLeft = 0;
                if (g.left)
                {
                    if (g.isLeftCollapse)
                    {
                        g.centerLeft += g.leftCollapse.width();
                        g.centerLeft += parseInt(g.leftCollapse.css('borderLeftWidth'));
                        g.centerLeft += parseInt(g.leftCollapse.css('borderRightWidth'));
                        g.centerLeft += parseInt(g.leftCollapse.css('left'));
                        g.centerLeft += p.space;
                    }
                    else
                    {
                        g.centerLeft += g.left.width();
                        g.centerLeft += parseInt(g.left.css('borderLeftWidth'));
                        g.centerLeft += parseInt(g.left.css('borderRightWidth'));
                        g.centerLeft += p.space;
                    }
                }
                g.center.css({ left: g.centerLeft });
                g.centerWidth >= 0 && g.center.width(g.centerWidth);
                g.middleHeight >= 0 && g.center.height(g.middleHeight);
                var contentHeight = g.middleHeight;
                if (g.center.header) contentHeight -= g.center.header.height();
                var padding = g.center.content.innerHeight() - g.center.content.height();
                var margin = g.center.content.outerHeight(true) - g.center.content.outerHeight();
                contentHeight = contentHeight-padding-margin;
                contentHeight >= 0 && g.center.content.height(contentHeight);

                g._updateCenterBottom(true);
            }
            if (g.left)
            {
                g.leftCollapse.height(g.middleHeight);
                g.left.height(g.middleHeight);
                /********* 左布局高度BUG修复 add by hzp at 20160229 *******/
                var contentHeight = g.middleHeight;
                if (g.left.header) contentHeight -= g.left.header.height();
                var padding = g.left.content.innerHeight() - g.left.content.height();
                var margin = g.left.content.outerHeight(true) - g.left.content.outerHeight();
                contentHeight = contentHeight-padding-margin;
                contentHeight >= 0 && g.left.content.height(contentHeight);
                /***************************************************/
            }
            if (g.right)
            {
                g.rightCollapse.height(g.middleHeight);
                g.right.height(g.middleHeight);
                //set left
                g.rightLeft = 0;

                if (g.left)
                {
                    if (g.isLeftCollapse)
                    {
                        g.rightLeft += g.leftCollapse.width();
                        g.rightLeft += parseInt(g.leftCollapse.css('borderLeftWidth'));
                        g.rightLeft += parseInt(g.leftCollapse.css('borderRightWidth'));
                        g.rightLeft += p.space;
                    }
                    else
                    {
                        g.rightLeft += g.left.width();
                        g.rightLeft += parseInt(g.left.css('borderLeftWidth'));
                        g.rightLeft += parseInt(g.left.css('borderRightWidth'));
                        g.rightLeft += parseInt(g.left.css('left'));
                        g.rightLeft += p.space;
                    }
                }
                if (g.center)
                {
                    g.rightLeft += g.center.width();
                    g.rightLeft += parseInt(g.center.css('borderLeftWidth'));
                    g.rightLeft += parseInt(g.center.css('borderRightWidth'));
                    g.rightLeft += p.space;
                }
                g.right.css({ left: g.rightLeft });
            }
            if (g.bottom)
            {
                g.bottomTop = g.layoutHeight - g.bottom.height() - 2;
                g.bottom.css({ top: g.bottomTop });
            }
            g._setDropHandlePosition();

        }
    });

    //重写数值控件 add by hzp at 20160308
    $.extend($.ligerDefaults.DateEditor,{
        isNegative:false
    });
    $.extend($.ligerui.controls.Spinner.prototype,{
        _showValue: function (value)
        {
            var g = this, p = this.options;
            /**** 默认值为空 ************/
            if (!value || value == "NaN") value = "";
            /***************************/
            if (p.type == 'float')
            {
                value = parseFloat(value).toFixed(p.decimalplace);
            }
            this.inputText.val(value)
        },
        _render: function ()
        {
            var g = this, p = this.options;
            g.interval = null;
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

            g.link = $('<div class="l-trigger"><div class="l-spinner-up"><div class="l-spinner-icon"></div></div><div class="l-spinner-split"></div><div class="l-spinner-down"><div class="l-spinner-icon"></div></div></div>');
            g.wrapper = g.inputText.wrap('<div class="l-text"></div>').parent();
            g.wrapper.append('<div class="l-text-l"></div><div class="l-text-r"></div>');
            g.wrapper.append(g.link).after(g.selectBox).after(g.valueField);
            g.link.up = $(".l-spinner-up", g.link);
            g.link.down = $(".l-spinner-down", g.link);
            g.inputText.addClass("l-text-field");

            if (p.disabled)
            {
                g.wrapper.addClass("l-text-disabled");
            }
            //初始化
            if (!g._isVerify(g.inputText.val()))
            {
                g.value = g._getDefaultValue();
                g._showValue(g.value);
            }
            //事件
            g.link.up.hover(function ()
            {
                if (!p.disabled)
                    $(this).addClass("l-spinner-up-over");
            }, function ()
            {
                clearInterval(g.interval);
                $(document).unbind("selectstart.spinner");
                $(this).removeClass("l-spinner-up-over");
            }).mousedown(function ()
            {
                if (!p.disabled)
                {
                    g._uping.call(g);
                    /********* 向上延时500 *************/
                    g.interval = setInterval(function ()
                    {
                        g._uping.call(g);
                    }, p.interval+500);
                    /**********************************/
                    $(document).bind("selectstart.spinner", function () { return false; });
                }
            }).mouseup(function ()
            {
                clearInterval(g.interval);
                g.inputText.trigger("change").focus();
                $(document).unbind("selectstart.spinner");
            });
            g.link.down.hover(function ()
            {
                if (!p.disabled)
                    $(this).addClass("l-spinner-down-over");
            }, function ()
            {
                clearInterval(g.interval);
                $(document).unbind("selectstart.spinner");
                $(this).removeClass("l-spinner-down-over");
            }).mousedown(function ()
            {
                if (!p.disabled)
                {
                    g.interval = setInterval(function ()
                    {
                        g._downing.call(g);
                    }, p.interval);
                    $(document).bind("selectstart.spinner", function () { return false; });
                }
            }).mouseup(function ()
            {
                clearInterval(g.interval);
                g.inputText.trigger("change").focus();
                $(document).unbind("selectstart.spinner");
            });

            g.inputText.change(function ()
            {
                var value = g.inputText.val();
                g.value = g._getVerifyValue(value);
                g.trigger('changeValue', [g.value]);
                g._showValue(g.value);
            }).blur(function ()
            {
                g.wrapper.removeClass("l-text-focus");
            }).focus(function ()
            {
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
            g.set(p);
        }
    });

    //重写Tip控件 add by hzp at 20160314
    $.extend($.ligerui.controls.Tip.prototype,{
        _render: function ()
        {
            var g = this, p = this.options;
            var tip = $('<div class="l-verify-tip"><div class="l-verify-tip-corner"></div><div class="l-verify-tip-content"></div></div>');
            g.tip = tip;
            g.tip.attr("id", g.id);
            if (p.content)
            {
                $("> .l-verify-tip-content:first", tip).html(p.content);
                tip.appendTo('body');
            }
            else
            {
                return;
            }
            /************* 样式调整修改 *********************************/
            tip.css({ left: p.x, top: p.y+3 }).show();
            p.width && $("> .l-verify-tip-content:first", tip).width(p.width - 36);
            /**********************************************/
            p.height && $("> .l-verify-tip-content:first", tip).width(p.height);
            eee = p.appendIdTo;
            if (p.appendIdTo)
            {
                p.appendIdTo.attr("ligerTipId", g.id);
            }
            if (p.target)
            {
                $(p.target).attr("ligerTipId", g.id);
                p.target.ligeruitipid = g.id;
            }
            p.callback && p.callback(tip);
            g.set(p);
        },
    });
})(jQuery, window);
