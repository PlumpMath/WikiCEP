$(function () {
    debugger;
    $("#jqGrid").jqGrid
    ({
        url: "/Definiciones/GetDefiniciones",
        datatype: 'json',
        mtype: 'Get',
        colNames: ['Titulo', 'FechaCreacion', 'Email'],
        colModel: [
        { key: true, hidden: true, name: 'Titulo', index: 'Titulo', editable: true },
            { key: false, name: 'FechaCreacion', index: 'FechaCreacion', editable: true },
            { key: false, name: 'Email', index: 'Email', editable: true },

        ],

        pager: jQuery('#grid'),
        rowNum: 40,
        rowList: [10, 20, 30, 40],
        height: '100%',
        viewrecords: true,
        caption: 'LISTA DE AUTORES',
        emptyrecords: 'SIN REGISTROS',

        jsonReader:
        {
            root: "rows",
            page: "page",
            total: "total",
            records: "records",
            repeatitems: false,
            Id: "0"

        },
        autowidth: true,
        multiselect: false,
        loadonce: true,

    })
     .navGrid('#grid',
    {
        edit: true,
        add: true,
        del: true,
        search: true,
        refresh: true
    }, {
        // edit options  
        zIndex: 100,
        url: '/Autor/Edit',
        closeOnEscape: true,
        closeAfterEdit: true,
        recreateForm: true,
        afterComplete: function (response) {
            if (response.responseText) {
                alert(response.responseText);
            }
        }
    }, {
        // add options  
        zIndex: 100,
        url: "/Definiciones/Create",
        closeOnEscape: true,
        closeAfterAdd: true,
        afterComplete: function (response) {
            if (response.responseText) {
                alert(response.responseText);
            }
        }
    }, {
        // delete options  
        zIndex: 100,
        url: "/Definiciones/Delete",
        closeOnEscape: true,
        closeAfterDelete: true,
        recreateForm: true,
        msg: "Esta seguro?",
        afterComplete: function (response) {
            if (response.responseText) {
                alert(response.responseText);
            }
        }

    });

    jQuery("#jqGrid").jqGrid('navButtonAdd', '#grid',
    {
        caption: "Exportar to Excel",
        onClickButton: function () {
            jQuery("#grid").jqGrid('excelExport', { url: '/Definiciones/ExportToExcel' });
        }
    })

});

