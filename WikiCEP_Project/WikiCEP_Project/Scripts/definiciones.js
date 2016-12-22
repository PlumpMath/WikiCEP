$(function () {
    $("#jqGrid").jqGrid
    ({
        url: "/Definiciones/GetDefiniciones",
        datatype: 'json',
        mtype: 'Get',
        colNames: ['IDDefinicion','Titulo', 'IDAutor', 'FechaCreacion', 'Texto'],
        colModel: [
            { key: true, hidden: true, name: 'IDDefinicion', index: 'IDDefinicion', editable: true },
            { key: false, hidden: false, name: 'Titulo', index: 'Titulo', editable: true },
            { key: false, hidden: false, name: 'IDAutor', index: 'IDAutor', editable: true },
            {
                key: false, name: 'FechaCreacion', index: 'FechaCreacion', editable: true, formatter: 'date',
                formatoptions: {
                newformat: 'd/m/Y h:m:s'
                }
            },
            { key: false, hidden: true, name: 'Texto', index: 'Texto', editable: true },
        ],

        pager: jQuery('#grid'),
        rowNum: 40,
        rowList: [10, 20, 30, 40],
        height: '100%',
        viewrecords: true,
        caption: 'Lista de Definiciones',
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
        url: '/Definiciones/Edit',
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

