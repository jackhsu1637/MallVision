<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Input.aspx.cs" Inherits="BigBigData.Input" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hiddenControls {
            display: none;
            opacity: 0;
        }

        #ddl_DS {
            margin-top: 50px;
        }

        .imgs-block {
            margin-top: 20px;
        }

        .img_blocks {
            width: 100px;
            height: 100px;
            background-size: cover;
        }

        .UploadImage {
            text-align: center;
            color: #000;
            font-size: 16px;
            line-height: 1.8;
            text-transform: capitalize;
            padding-top: 50px;
            padding-bottom: 47px;
            opacity: .85;
        }

        /*.ds_block {
            padding: 5px;
            border: 1px solid #333;
            border-radius: 8px;
        }*/
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="text-align: center; background-color: #00aabe;" class="alert alert-light" role="alert">
        <img src="/Images/banner.jpg" width="80%" />
    </div>

    <div class="col-sm-6 col-md-6 float-left">
        <i class="fa fa-map-o" aria-hidden="true" style="margin-right: 3px;"></i>1. Upload floor map:
        <center>
            <div class="UploadImage" onclick="AddImages();">
                <i class="fa fa-picture-o" aria-hidden="true"></i>
                <br />
                Upload Images
            </div>
        </center>
        <div id="imgs-block">
        </div>

        <div class="hiddenControls">
            <input id="FileUpload1" type="file" name="file_upload" />
        </div>
        <div class="clearfix"></div>

    </div>

    <div class="col-sm-6 col-md-6 float-right">
        <i class="fa fa-database" aria-hidden="true" style="margin-right: 3px;"></i>2. Select the dataset:
        <center>
             <select class="form-control" id="ddl_DS" onchange="ChangeDS();">
                <option value="">-Please select-</option>
                <option value="201809">2018-09</option>
                <option value="201808">2018-08</option>
                <option value="201807">2018-07</option>
                <option value="201806">2018-06</option>
              </select>

            <!--<input id="FileUpload2" type="file" name="file_upload" />-->
        </center>
        <div id="dataset-block">
        </div>
    </div>
    <div class="clearfix"></div>

    <div style="padding-top: 50px;">
        <center>
            <input id="btnAnalyze" class="btn btn-success" type="button" value="&#xf085; 3. Analyze!" style="font-family: FontAwesome;" />
            <div id="loading" style="display: none;">
                <i class="fa fa-spinner fa-spin fa-3x fa-fw"></i>
                <span class="sr-only">Loading...</span>
            </div>
        </center>
    </div>
    <div class="clearfix"></div>

    <script>
        var imgOK = false;
        var datasetOK = false;

        function ChangeDS() {
            if ($("#ddl_DS").val() == "")
                datasetOK = false;
            else
                datasetOK = true;
        }

        function AddImages() {

            $('#FileUpload1').uploadifive({
                //'fileSizeLimit': '3MB',
                'buttonClass': 'btn btn-sm btn-warning',
                'buttonText': 'Upload Files',
                'height': 40,
                'width': 137,
                'multi': true,
                'queueSizeLimit': 10,
                'uploadLimit': 0,
                'simUploadLimit': 1,
                'removeCompleted': true,
                'uploadScript': 'Upload_AllFiles.ashx',
                //'formData': { 'permission': permission },
                'onInit': function () {
                    $("#uploadifive-FileUpload1 input[type=file]").eq(1).click();
                },
                'onUpload': function (file) {
                    $("#FileUpload1").data('uploadifive').settings.formData = { //Set data before upload files
                        //'folderID': folderID
                        //////////'folderID': $("#uploadifive-FileUpload1").data("folderid")
                    };
                },
                'onUploadComplete': function (file, data) {
                    //showNotification_Scale('info', "File(s) uploaded successfully.");
                    console.log("File(s) uploaded successfully.");
                    console.log(data);

                    imgOK = true;

                    var html = "<img class='img_blocks' style='background-image: url(" + data + ")' />";
                    $("#imgs-block").append(html);

                    //http://localhost:53591/UserUpload/2018102020480837110855.png
                },
                'onError': function (errorType) {
                    //showNotification_Scale('error', 'Error occured, the error was: ' + errorType);
                    //showJSAlert('error', 'System Alert:', 'Error occured, the error was: ' + errorType + '.\r\nMaybe the file size too large, try to refresh the browser and upload again.', 'OK', '9999');
                    console.log('Error occured, the error was: ' + errorType + '.\r\nMaybe the file size too large, try to refresh the browser and upload again.');
                }
            });
        }

        $(function () {
            $("#btnAnalyze").click(function () {
                if (!imgOK) {
                    swal({
                        type: 'error',
                        title: 'Oops...',
                        text: 'Missing floor plan file(s)!',
                        footer: '<a href>Why do I have this issue?</a>'
                    });
                }
                else if (!datasetOK) {
                    swal({
                        type: 'error',
                        title: 'Oops...',
                        text: 'Missing dataset file!',
                        footer: '<a href>Why do I have this issue?</a>'
                    });
                }
                else {
                    $("#btnAnalyze").hide();
                    $("#loading").show();

                    setTimeout(function () {
                        window.location.replace('Analyze.aspx');
                    }, 2500);
                }
            });

            /*
            $('#FileUpload1').uploadifive({
                //'fileSizeLimit': '3MB',
                'buttonClass': 'btn btn-sm btn-warning',
                'buttonText': 'Upload Files',
                'height': 40,
                'width': 137,
                'multi': true,
                'queueSizeLimit': 10,
                'uploadLimit': 0,
                'simUploadLimit': 1,
                'removeCompleted': true,
                'uploadScript': 'Upload_AllFiles.ashx',
                //'formData': { 'permission': permission },
                'onInit': function () {
                    $("#uploadifive-FileUpload1 input[type=file]").eq(1).click();
                },
                'onUpload': function (file) {
                    $("#FileUpload1").data('uploadifive').settings.formData = { //Set data before upload files
                        //'folderID': folderID
                        //////////'folderID': $("#uploadifive-FileUpload1").data("folderid")
                    };
                },
                'onUploadComplete': function (file, data) {
                    //showNotification_Scale('info', "File(s) uploaded successfully.");
                    console.log("File(s) uploaded successfully.");
                    console.log(data);

                    imgOK = true;

                    var html = "<img class='img_blocks' style='background-image: url(" + data + ")' />";
                    $("#imgs-block").append(html);

                    //http://localhost:53591/UserUpload/2018102020480837110855.png
                },
                'onError': function (errorType) {
                    //showNotification_Scale('error', 'Error occured, the error was: ' + errorType);
                    //showJSAlert('error', 'System Alert:', 'Error occured, the error was: ' + errorType + '.\r\nMaybe the file size too large, try to refresh the browser and upload again.', 'OK', '9999');
                    console.log('Error occured, the error was: ' + errorType + '.\r\nMaybe the file size too large, try to refresh the browser and upload again.');
                }
            });
            */

            $('#FileUpload2').uploadifive({
                //'fileSizeLimit': '3MB',
                'buttonClass': 'btn btn-sm btn-warning',
                'buttonText': 'Upload Dataset',
                'height': 40,
                'width': 137,
                'multi': false,
                'queueSizeLimit': 1,
                'uploadLimit': 0,
                'simUploadLimit': 1,
                'removeCompleted': true,
                'uploadScript': 'Upload_AllFiles.ashx',
                //'formData': { 'permission': permission },
                'onUpload': function (file) {
                    $("#FileUpload2").data('uploadifive').settings.formData = { //Set data before upload files
                        //'folderID': folderID
                        //////////'folderID': $("#uploadifive-FileUpload1").data("folderid")
                    };
                },
                'onUploadComplete': function (file, data) {
                    //showNotification_Scale('info', "File(s) uploaded successfully.");
                    console.log("File(s) uploaded successfully.");
                    console.log(data);

                    datasetOK = true;

                    var html = "<span class=ds_block><i class='fa fa-file-text-o fa-4x'></i></span>";
                    //imgs-block
                    $("#dataset-block").append(html);
                },
                'onError': function (errorType) {
                    //showNotification_Scale('error', 'Error occured, the error was: ' + errorType);
                    //showJSAlert('error', 'System Alert:', 'Error occured, the error was: ' + errorType + '.\r\nMaybe the file size too large, try to refresh the browser and upload again.', 'OK', '9999');
                    console.log('Error occured, the error was: ' + errorType + '.\r\nMaybe the file size too large, try to refresh the browser and upload again.');
                }
            });
        });
    </script>
</asp:Content>
