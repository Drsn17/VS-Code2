/*({
    doInit: function (c, e, h) {
        c.set('v.gridColumns', [
            //{label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Account Name',  type: 'url',fieldName: 'Id', typeAttributes : { 'label' : {fieldName:'Name'}}},
            {label: 'Phone', fieldName: 'Phone', type: 'phone'},
            ]);
        h.getAcctContacts(c);
    }
})*/

({
   doInit: function (c, e, h) {
    c.set('v.gridColumns', [
               {label: 'name', fieldName: 'name', type: 'text'},
               {label: 'label', fieldName: 'label', type: 'text'},
               ]);
   h.getAcctContacts(c,e,h);
    console.log('esdrfghjk2');

   }
 })

/* {label: 'Account Name',  type: 'url', typeAttributes:{ label: { fieldName: 'https://ds17-dev-ed.my.salesforce.com/a007F00000xQXmO' } }},*/
    /*init: function (c, e, h) {
    var ab = c.find("gridData");
        var columns = [
            {
                type: 'url',
                fieldName: 'accountNameUrl',
                label: 'Developer Name',
                initialWidth: 300,
                typeAttributes:
                {
                    label: { fieldName: 'accountName' }
                }
            },
            {
                type: 'number',
                fieldName: 'totalProject',
                label: 'Total Project'
            },
            {
                type: 'number',
                fieldName: 'teamMember',
                label: 'Total Team Member'
            },
            {
                type: 'text',
                fieldName: 'role',
                label: 'Designation'
             }
        ];

        c.set('v.gridColumns', columns);

        // data
        var nestedData = [
            {
                "name": "123555",
                "accountName": "Rewis Inc",
                "accountNameUrl": "http://google.com/",
                "totalProject": 2,
                "teamMember": 0,
                "role": ab
            },

            {
                "name": "123556",
                "accountName": "Team Lead 1",
                "accountNameUrl": "http://google.com/",
                "totalProject": 5,
                "teamMember": 7,
                "role": "Team Lead",
                "_children": [
                    {
                        "name": "123556-A",
                        "accountName": "Team Lead 1.1",
                        "accountNameUrl": "http://google.com/",
                        "totalProject": 5,
                        "teamMember": 7,
                        "role": "Sr SF Developer",
                        "_children": [
                            {
                                "name": "123556-A-A",
                                "accountName": "Developer 1",
                                "accountNameUrl": "http://google.com/",
                                "totalProject": 2,
                                "teamMember": 0,
                                "role": "SF Developer"
                            },
                            {
                                "name": "123556-A-B",
                                "accountName": "Developer 1",
                                "accountNameUrl": "http://google.com/",
                                "totalProject": 2,
                                "teamMember": 0,
                                "role": "SF Developer"
                            }
                        ]
                    },

                    {
                        "name": "123556-B",
                         "accountName": "Team Lead 1.2",
                         "accountNameUrl": "http://google.com/",
                         "totalProject": 8,
                         "teamMember": 2,
                         "role": "Sr SF Developer",
                         "_children": [
                            {
                                "name": "123556-B-A",
                                "accountName": "Developer 1",
                                "accountNameUrl": "http://google.com/",
                                "totalProject": 2,
                                "teamMember": 0,
                                "role": "SF Developer"
                            },
                            {
                                "name": "123556-B-B",
                                "accountName": "Developer 1",
                                "accountNameUrl": "http://google.com/",
                                "totalProject": 2,
                                "teamMember": 0,
                                "role": "SF Developer",
                                "_children": [
                                    {
                                        "name": "123556-B-B-A",
                                        "accountName": "Developer 1",
                                        "accountNameUrl": "http://google.com/",
                                        "totalProject": 2,
                                        "teamMember": 0,
                                        "role": "SF Developer",
                                        "_children": [
                                            {
                                                "name": "123556-B-B-A-A",
                                                "accountName": "Developer 1",
                                                "accountNameUrl": "http://google.com/",
                                                "totalProject": 2,
                                                "teamMember": 0,
                                                "role": "SF Developer"
                                            }
                                        ]
                                    }
                                ]
                            }
                        ]
                    }
                ]
            },

            {
                "name": "123557",
                "accountName": "Team Lead 2",
                "accountNameUrl": "http://google.com/",
                "totalProject": 4,
                "teamMember": 5,
                "role": "Team Lead",
                "_children": [
                    {
                        "name": "123557-A",
                        "accountName": "Team Lead 1.1",
                        "accountNameUrl": "http://google.com/",
                        "totalProject": 5,
                        "teamMember": 7,
                        "role": "Sr SF Developer"
                    }
                ]
            },

            {
                "name": "123558",
                "accountName": "Team Lead 3",
                "accountNameUrl": "http://google.com/",
                "totalProject": 3,
                "teamMember": 4,
                "role": "Team Lead",
                "_children": [
                    {
                        "name": "123558-A",
                        "accountName": "Team Lead 1.1",
                        "accountNameUrl": "http://google.com/",
                        "totalProject": 5,
                        "teamMember": 7,
                        "role": "Sr SF Developer"
                    }
                ]
            }
        ];

        c.set('v.gridData', nestedData);


        var expandedRows = ["123556", "123556-A", "123556-B", "123556-B-B", "123557"];

        c.set('v.gridExpandedRows', expandedRows);
    },
    getState: function(c, e, h) {
        c.set('v.currentExpandedRows', "");
        var treeGridCmp = c.find('treeGrid');
        c.set('v.currentExpandedRows', treeGridCmp.getCurrentExpandedRows().toString());
    }*/
 // eslint-disable-line