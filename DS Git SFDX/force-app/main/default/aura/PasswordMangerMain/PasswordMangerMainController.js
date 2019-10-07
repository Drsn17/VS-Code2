({
    handleShowActiveSectionName: function (c, e, h) {
        alert(c.find("accordion").get('v.activeSectionName'));
    },
    handleSetActiveSectionC: function (c, e ,h) {
        c.find("accordion").set('v.activeSectionName', 'C');
    },
    handleActive: function (c, e, h) {
            h.handleActive(c, e, h);
       }
})