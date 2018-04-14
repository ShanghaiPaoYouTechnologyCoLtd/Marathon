var TableEditable = function () {
    return {
        init: function () {
            function bindHandle() {
                $('.sample_editable_1 .delete').unbind('click');
                $('.sample_editable_1 .cancel').unbind('click');
                $('.sample_editable_1 .edit').unbind('click');

                $('.sample_editable_1 .delete').bind('click', function (e) {
                    e.preventDefault();

                    if (confirm("Are you sure to delete this row ?") == false) {
                        return;
                    }
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                    alert("Deleted! Do not forget to do some ajax to sync with backend :)");
                });
                $('.sample_editable_1 .cancel').bind('click', function (e) {
                    e.preventDefault();
                    if ($(this).attr("data-mode") == "new") {
                        var nRow = $(this).parents('tr')[0];
                        oTable.fnDeleteRow(nRow);
                    } else {
                        restoreRow(oTable, nEditing);
                        nEditing = null;
                    }
                });

                $('.sample_editable_1 .edit').bind('click', function (e) {
                    e.preventDefault();

                    var nRow = $(this).parents('tr')[0];
                    if (nEditing !== null && nEditing != nRow) {
                        restoreRow(oTable, nEditing);
                        editRow(oTable, nRow);
                        nEditing = nRow;
                    } else if (nEditing == nRow && this.innerHTML == "Save") {
                        saveRow(oTable, nEditing);
                        nEditing = null;
                        alert("Updated! Do not forget to do some ajax to sync with backend :)");
                    } else {
                        editRow(oTable, nRow);
                        nEditing = nRow;
                    }
                });
            }

            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }
                oTable.fnDraw();
                bindHandle();
            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[2] + '">';
                jqTds[3].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[3] + '">';
                jqTds[4].innerHTML = '<a class="edit" href="javascript:;">Save</a>';
                jqTds[5].innerHTML = '<a class="cancel" href="javascript:;">Cancel</a>';
                bindHandle();
            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate('<a class="edit" href="javascript:;">Edit</a>', nRow, 4, false);
                oTable.fnUpdate('<a class="delete" href="javascript:;">Delete</a>', nRow, 5, false);
                oTable.fnDraw();
                bindHandle();
            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate(jqInputs[3].value, nRow, 3, false);
                oTable.fnUpdate('<a class="edit" href="javascript:;">Edit</a>', nRow, 4, false);
                oTable.fnDraw();
                bindHandle();
            }

            var oTable = $('.sample_editable_1').dataTable({
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "全部"]
                ],
                "iDisplayLength": 5,
                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType": "bootstrap",
                "oLanguage": {
                    "sLengthMenu": "_MENU_ 页面记录数",
                    "oPaginate": {
                        "sPrevious": "上一页",
                        "sNext": "下一页"
                    }
                },
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });

            jQuery('.sample_editable_1_wrapper .dataTables_filter input').addClass("m-wrap medium"); 
            jQuery('.sample_editable_1_wrapper .dataTables_length select').addClass("m-wrap small");

            var nEditing = null;

            $('.sample_editable_new').click(function (e) {
                e.preventDefault();
                var aiNew = oTable.fnAddData(['', '', '', '',
                        '<a class="edit" href="javascript:;">Edit</a>',
                        '<a class="cancel" data-mode="new" href="javascript:;">Cancel</a>'
                ]);
                var nRow = oTable.fnGetNodes(aiNew[0]);
                editRow(oTable, nRow);
                nEditing = nRow;
            });
            bindHandle();
        }
    };
}();