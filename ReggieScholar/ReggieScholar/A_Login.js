$(document).ready(function () {
    $("#logo").delay(1000).css({ opacity: 0 }).animate({ top: "40", opacity: 1.0 }, 3000);  //show logo
    $("#loginControls, #newsFeed, .footerMsg").delay(3800).css({ opacity: 0 }).animate({ bottom: "-90", opacity: 1.0 }, 3000); //show rest of page
});

function showAccessDeniedPanel() {
    $("#loginControls").detach(); //hide login controls
    $("#accessDenied").css({ display:"block", opacity: 0 }).animate({ bottom: "-90", opacity: 1.0 }, 1000);  //show access denied panel
};

