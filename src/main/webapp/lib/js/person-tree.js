	var setting = {
		view: {
			selectedMulti: false,
			showIcon: showIconForTree,
			showTitle: false,
			dblClickExpand: false,
			showLine: false
		},
		callback: {
			onRightClick: OnRightClick,
			onClick: onClick
		}
	};

	function showIconForTree(treeId, treeNode) {
		return treeNode.isParent;
	}

	var zNodes = [{
			name: "父节点1 - 展开",
			open: true,
			noR: true,
			iconSkin: "people",
			children: [{
				name: "父节点11 - 折叠",
				iconSkin: "people",
				children: [{
					name: "叶子节点111"
				}, {
					name: "叶子节点112"
				}, {
					name: "叶子节点113"
				}, {
					name: "叶子节点114"
				}]
			}, {
				name: "父节点12 - 折叠",
				iconSkin: "people",
				children: [{
					name: "叶子节点121"
				}, {
					name: "叶子节点122"
				}, {
					name: "叶子节点123"
				}, {
					name: "叶子节点124"
				}]
			}, {
				name: "父节点13 - 没有子节点",
				iconSkin: "people",
				isParent: true
			}]
		}, {
			name: "父节点2 - 折叠",
			iconSkin: "people",
			children: [{
				name: "父节点21 - 展开",
				iconSkin: "people",
				open: true,
				children: [{
					name: "叶子节点211"
				}, {
					name: "叶子节点212"
				}, {
					name: "叶子节点213"
				}, {
					name: "叶子节点214"
				}]
			}, {
				name: "父节点22 - 折叠",
				iconSkin: "people",
				children: [{
					name: "叶子节点221"
				}, {
					name: "叶子节点222"
				}, {
					name: "叶子节点223"
				}, {
					name: "叶子节点224"
				}]
			}, {
				name: "父节点23 - 折叠",
				iconSkin: "people",
				children: [{
					name: "叶子节点231"
				}, {
					name: "叶子节点232"
				}, {
					name: "叶子节点233"
				}, {
					name: "叶子节点234"
				}]
			}]
		}, {
			name: "父节点3 - 没有子节点",
			iconSkin: "people",
			isParent: true
		}

	];

	function onClick(e,treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("ztreesolidarrow");
		zTree.expandNode(treeNode);
	}

	function OnRightClick(event, treeId, treeNode) {
		if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
			zTree.cancelSelectedNode();
			showRMenu("root", event.clientX, event.clientY);
		} else if (treeNode && !treeNode.noR) {
			zTree.selectNode(treeNode);
			showRMenu("node", event.clientX, event.clientY);
		}
	}

	function showRMenu(type, x, y) {
		$("#rMenu ul").show();
		if (type == "root") {
			$("#m_del").hide();
			$("#m_check").hide();
			$("#m_unCheck").hide();
		} else {
			$("#m_del").show();
			$("#m_check").show();
			$("#m_unCheck").show();
		}
		rMenu.css({
			"top": y + "px",
			"left": x + "px",
			"visibility": "visible"
		});

		$("body").bind("mousedown", onBodyMouseDown);
	}

	function hideRMenu() {
		if (rMenu) rMenu.css({
			"visibility": "hidden"
		});
		$("body").unbind("mousedown", onBodyMouseDown);
	}

	function onBodyMouseDown(event) {
		if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length > 0)) {
			rMenu.css({
				"visibility": "hidden"
			});
		}
	}
	var addCount = 1;

	function addTreeNode() {
		hideRMenu();
		var newNode = {
			name: "增加" + (addCount++)
		};
		if (zTree.getSelectedNodes()[0]) {
			newNode.checked = zTree.getSelectedNodes()[0].checked;
			zTree.addNodes(zTree.getSelectedNodes()[0], newNode);
		} else {
			zTree.addNodes(null, newNode);
		}
	}

	function removeTreeNode() {
		hideRMenu();
		var nodes = zTree.getSelectedNodes();
		if (nodes && nodes.length > 0) {
			if (nodes[0].children && nodes[0].children.length > 0) {
				var msg = "要删除的节点是父节点，如果删除将连同子节点一起删掉。\n\n请确认！";
				if (confirm(msg) == true) {
					zTree.removeNode(nodes[0]);
				}
			} else {
				zTree.removeNode(nodes[0]);
			}
		}
	}

	function checkTreeNode(checked) {
		var nodes = zTree.getSelectedNodes();
		if (nodes && nodes.length > 0) {
			zTree.checkNode(nodes[0], checked, true);
		}
		hideRMenu();
	}

	function resetTree() {
		hideRMenu();
		$.fn.zTree.init($("#ztreesolidarrow"), setting, zNodes);
	}

	function editNode() {
		hideRMenu();
		var nodes = zTree.getSelectedNodes()[0];
		zTree.editName(nodes);
		//console.log(zTree);
	}

	function showCode(str) {
		var code = $("#code");
		code.empty();
		for (var i = 0, l = str.length; i < l; i++) {
			code.append("<li>" + str[i] + "</li>");
		}
	}

	var zTree, rMenu;

	$(document).ready(function() {
		$.fn.zTree.init($("#ztreesolidarrow"), setting, zNodes);
		zTree = $.fn.zTree.getZTreeObj("ztreesolidarrow");
		rMenu = $("#rMenu");
	});