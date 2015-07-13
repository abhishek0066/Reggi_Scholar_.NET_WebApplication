$(document).ready(function () {


    var $pickButtonOne = $("#dropdownCourseNumber");

    $("#dropdownListOne li a").on("click", function () {
        var courseNum = $(this).text();
        $pickButtonOne.text(courseNum);

        $("#hiddenCourseNumber").val(courseNum);
        //Insert chosen course num put into hidden field
    });

    var $pickButtonTwo = $("#dropdownSemester");

    $("#dropdownListTwo li a").on("click", function () {
        var semesterComplete = $(this).text();
        $pickButtonTwo.text(semesterComplete);

        $("#hiddenSemester").val(semesterComplete);
        //Insert chosen semester put into hidden field
    });

    var $pickButtonThree = $("#buttonDropdownThree");
    
    $("#dropdownListThree li a").on("click", function () {
        //Show all commitee name that are hidden
        $("#dropdownListFour li a:hidden").show();
        var committeeChair = $(this).text();
        //Hide committee name in fourth (just below) dropdown list
        $("#dropdownListFour li a:contains(" + committeeChair + ")").hide();
        
        $pickButtonThree.text(committeeChair);
        $("#hiddenCommitteeOne").val(committeeChair);
        //Insert chosen commitee chair put into hidden field
    });

    var $pickButtonFour = $("#buttonDropdownFour");

    $("#dropdownListFour li a").on("click", function () {
        //Show all commitee name that are hidden
        $("#dropdownListThree li a:hidden").show();
        var committeeMember = $(this).text();
        //Hide committee name in third (just above) dropdown list
        $("#dropdownListThree li a:contains(" + committeeMember + ")").hide();
        $pickButtonFour.text(committeeMember);
        $("#hiddenCommitteeTwo").val(committeeMember);
        //Insert chosen commitee member into hidden field
    });

    var $pickButtonFive = $("#buttonDropdownFive");

    $("#dropdownListFive li a").on("click", function () {
        var graduateAdvisor = $(this).text();
        $pickButtonFive.text(graduateAdvisor);

        $("#hiddenGA").val(graduateAdvisor);
        //Insert chosen GA into hidden field
    });

    $("#fileUploadImage").fileinput({
        initialPreview: [
            "<img src='images/stormTrooper.jpg' class='imageCenter'"
        ],
        previewFileType: "image",
        browseClass: "btn btn-success customFileInput",
        browseLabel: " Profile Image",
        browseIcon: '<i class="glyphicon glyphicon-camera glyphSize"></i>',
        showRemove: false,
        showUpload: false,
        showCaption: false
    });

    $("#fileUploadPDF").fileinput({
        browseClass: "btn btn-success customFileInput",
        browseLabel: " Upload PDF",
        browseIcon: '<i class="glyphicon glyphicon-open-file"></i>',
        showRemove: false,
        showUpload: false,
        showCaption: false
    });

    $("#fileUploadZIP").fileinput({
        browseClass: "btn btn-success customFileInput",
        browseLabel: " Upload ZIP",
        browseIcon: '<i class="glyphicon glyphicon-paperclip"></i>',
        showRemove: false,
        showUpload: false,
        showCaption: false
    });
});


