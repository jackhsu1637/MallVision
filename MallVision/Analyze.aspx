<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Analyze.aspx.cs" Inherits="BigBigData.Analyze" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #loading {
            position: fixed;
            z-index: 999;
            height: 2em;
            width: 2em;
            overflow: show;
            margin: auto;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
        }

        #ttl_visitors, #ttl_revenue, #ttl_rental{
            font-size: 20px;
        }

        .up {
            color: green;
        }

        .down {
            color: red;
        }

        #droppable {
            /*background-image: url(https://scontent.xx.fbcdn.net/v/t1.0-9/q87/p720x720/31265410_10155572911981…cat=101&_nc_ht=scontent.xx&oh=628e22b…&oe=5C4E1DA1);*/
            background-position: center center;
            background-size: cover;
        }

        .floor-plan-nav {
            width: 330px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
        <nav class="floor-plan-nav" aria-label="Page navigation example">
            <ul id="nav_level" class="pagination">
                <li class="page-item disabled"><a class="page-link" href="#">Floors:</a></li>
                <li class="page-item"><a class="page-link lv" href="#" data-lv="1">L1</a></li>
                <li class="page-item"><a class="page-link lv" href="#" data-lv="2">L2</a></li>
                <li class="page-item"><a class="page-link lv" href="#" data-lv="3">L3</a></li>
                <li class="page-item"><a class="page-link lv" href="#" data-lv="4">L4</a></li>
            </ul>
        </nav>
    </center>

    <div class="col-md-4 float-left">
        <div class="col-6 float-left">
            <h3>Categories</h3>
            <div class="list-group" id="list1-tab" role="tablist">
                <a class="list-group-item list-group-item-action active" id="list1_foo" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Beauty & Others</a>
                <a class="list-group-item list-group-item-action" id="list1_ele" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Entertainment</a>
                <a class="list-group-item list-group-item-action" id="list1_ent" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Audio Visual</a>
                <a class="list-group-item list-group-item-action" id="list1_etc" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Dining</a>
            </div>
        </div>
        <div class="col-6 float-right">
            <h3>Shops</h3>
            <div class="list-group" id="list2-tab" role="tablist">
                <a class="list-group-item list-group-item-action draggable" id="list2_0" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Clinique</a>
                <a class="list-group-item list-group-item-action draggable" id="list2_1" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Dior</a>
                <a class="list-group-item list-group-item-action draggable" id="list2_2" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">FANCL</a>
                <a class="list-group-item list-group-item-action draggable" id="list2_3" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Glycel</a>
                <a class="list-group-item list-group-item-action draggable" id="list2_4" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">IPSA</a>
                <a class="list-group-item list-group-item-action draggable" id="list2_5" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Mannings</a>
                <a class="list-group-item list-group-item-action draggable" id="list2_6" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Apple</a>
            </div>

            <div class="highlight" style="margin-top: 30px;">
                <div class="form-group">
                    <label for="txtNewShop"><b>New Shop</b></label>
                    <input type="text" class="form-control" id="txtNewShop" placeholder="New shop name">
                </div>
                <input class="btn btn-info col-12" onclick="AddShop()" value="Add" />
            </div>
        </div>
    </div>

    <div class="col-md-8 float-right">
        <h3>Floor Plan of <span class="floor">1</span>/F</h3>
        <div class="clearfix"></div>
        <div id="droppable" style="width: 100%; height: 508px; background-color: #ccc;">
        </div>
    </div>
    <div class="clearfix"></div>

    <div class="col-12">
        <h3>Estimation:</h3>
        <div class="clearfix"></div>

        <div class="col-12">
           <div class="col-4 float-left">
               <div>Total est. visitors: <span id="ttl_visitors"></span>/month</div>
           </div>
            <div class="col-4 float-left">
                <div>Total est. revenue: HKD $<span id="ttl_revenue"></span></div>
            </div>
            <div class="col-4 float-left">
                <div>Total est. rental: HKD $<span id="ttl_rental"></span></div>
            </div>
        </div>
        
        
        

        <div id="shops_estimate"></div>
        <center>
            <nav class="floor-plan-nav" aria-label="Page navigation example">
                <ul id="nav_shops" class="pagination">
                    <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-left" aria-hidden="true" style="margin-right:3px;"></i>Previous</a></li>
                    <li class="page-item"><a class="page-link lv" href="#" data-lv="1">1</a></li>
                    <li class="page-item"><a class="page-link lv" href="#" data-lv="2">2</a></li>
                    <li class="page-item"><a class="page-link lv" href="#" data-lv="3">3</a></li>
                    <li class="page-item"><a class="page-link lv" href="#" data-lv="4">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next<i class="fa fa-angle-right" aria-hidden="true" style="margin-left:3px;"></i></a></li>
                </ul>
            </nav>
        </center>
    </div>

    <div id="loading" style="display: none;">
        <i class="fa fa-spinner fa-spin fa-3x fa-fw"></i>
        <div style="width: 100%; height: 100%; background-color: #fff; opacity: 0.6; position: fixed; top: 0; left: 0; z-index: -1;"></div>
    </div>

    <script>
        var currCategory = "list1_foo";
        var currfloor = 1;
        var demoState = 1;

        function showLoading() {
            $("#loading").show();
            setTimeout(function () {
                $("#loading").hide();
            }, 2500);
        }

        function AddShop() {
            var shopname = $("#txtNewShop").val();
            if (shopname == '')
                return;
            cat_shops.list1_foo.push({ "name": shopname });

            var display = "";

            //var count = Object.keys(cat_shops).length;
            var arr = eval("cat_shops." + currCategory);
            for (var i = 0; i < arr.length; i++) {
                var name = arr[i].name;
                var active = "";
                if (i == 0)
                    active = "active";
                display += '<a class="list-group-item list-group-item-action draggable" id="list2_"' + i + ' data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">' + name + '</a>';
            }
            $("#list2-tab").html(display);

            $("#txtNewShop").val("");

            //For demo step 3
            demoState = 2;

            $(".draggable").draggable({
                revert: true
            });
        }

        $("#nav_level .lv").on('click', function (e) {
            e.preventDefault();

            currfloor = $(this).attr("data-lv");
            $(".floor").text(currfloor);

            $("#loading").show();
            setTimeout(function () {
                $("#loading").hide();

                updateData("lv" + currfloor + "_org"); //i.e. lv1_org

                $("#droppable").css("background-image", "url(/Images/lv" + currfloor + "_org.jpg)");
            }, 1500);

        });

        //Level and shops
        var cat_shops = {
            "list1_foo": [
                { "name": "Clinique" },
                { "name": "Dior" },
                { "name": "FANCL" },
                { "name": "Glycel" },
                { "name": "IPSA" },
                { "name": "Mannings" },
                { "name": "Apple" },
            ],
            "list1_ele": [
                { "name": "PALACE apm" },
                { "name": "UA Cinema" },
                { "name": "Broadway Cinema" },
            ],
            "list1_ent": [
                { "name": "Smartone" },
                { "name": "3 Shop" },
                { "name": "Broadway" },
                { "name": "Wilson Communications" },
            ],
            "list1_etc": [
                { "name": "Genki Sushi" },
                { "name": "Itacho Sushi" },
                { "name": "KFC" },
                { "name": "Kingduck" },
            ]
        };

        $('#list1-tab a').on('click', function (e) {
            e.preventDefault();

            currCategory = e.target.id;
            var display = "";

            //var count = Object.keys(cat_shops).length;
            var arr = eval("cat_shops." + currCategory);
            for (var i = 0; i < arr.length; i++) {
                var name = arr[i].name;
                var active = "";
                if (i == 0)
                    active = "active";
                display += '<a class="list-group-item list-group-item-action draggable" id="list2_"' + i + ' data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">' + name + '</a>';
            }
            $("#list2-tab").html(display);


            $(".draggable").draggable({
                revert: true
            });
        })

        //
        var est_data = {
            "lv1_org": {
                "est_ttl_visitors": 25150,
                "shops": [
                    { "name": "Eslite", "est_flow": 2200, "est_revenue": 225000, "est_rental": 150000 },
                    { "name": "Dior", "est_flow": 3150, "est_revenue": 1420000, "est_rental": 450000 },
                    { "name": "FANCL", "est_flow": 2300, "est_revenue": 980000, "est_rental": 250000 },
                    { "name": "Glycel", "est_flow": 1600, "est_revenue": 391000, "est_rental": 230000 },
                    { "name": "IPSA", "est_flow": 1800, "est_revenue": 527000, "est_rental": 310000 },
                    { "name": "Mannings", "est_flow": 14100, "est_revenue": 598000, "est_rental": 460000 },                    
                ]
            },
            "lv1_upt1": {
                "est_ttl_visitors": 92437,
                "shops": [
                    { "name": "Apple", "est_flow": 7194, "est_flow_per": 327, "est_revenue": 6277500, "est_revenue_per": 0, "est_rental": 3720000, "est_rental_per": 0 },
                    { "name": "Eslite", "est_flow": 2794, "est_flow_per": 127, "est_revenue": 292500, "est_revenue_per": 130, "est_rental": 192000, "est_rental_per": 128 },
                    { "name": "Dior", "est_flow": 7088, "est_flow_per": 225, "est_revenue": 1530000, "est_revenue_per": 202, "est_rental": 900000, "est_rental_per": 200 },
                    { "name": "FANCL", "est_flow": 4140, "est_flow_per": 180, "est_revenue": 1411200, "est_revenue_per": 144, "est_rental": 375000, "est_rental_per": 150 },
                    { "name": "Glycel", "est_flow": 1744, "est_flow_per": 109, "est_revenue": 410550, "est_revenue_per": 105, "est_rental": 234600, "est_rental_per": 102 },
                    { "name": "IPSA", "est_flow": 1746, "est_flow_per": 97, "est_revenue": 548080, "est_revenue_per": 104, "est_rental": 319300, "est_rental_per": 103 },
                    { "name": "Mannings", "est_flow": 12549, "est_flow_per": 89, "est_revenue": 603980, "est_revenue_per": 101, "est_rental": 464600, "est_rental_per": 101 },
                ]
            },
            "lv1_upt2": {
                "est_ttl_visitors": 51064,
                "shops": [
                    { "name": "TenRen Tea Co", "est_flow": 6754, "est_flow_per": 307, "est_revenue": 875000, "est_revenue_per": 0, "est_rental": 700000, "est_rental_per": 0 },
                    { "name": "Eslite", "est_flow": 6886, "est_flow_per": 313, "est_revenue": 600750, "est_revenue_per": 267, "est_rental": 420000, "est_rental_per": 280 },
                    { "name": "Dior", "est_flow": 4064, "est_flow_per": 129, "est_revenue": 1959600, "est_revenue_per": 138, "est_rental": 598500, "est_rental_per": 133 },
                    { "name": "FANCL", "est_flow": 3450, "est_flow_per": 150, "est_revenue": 1381800, "est_revenue_per": 141, "est_rental": 360000, "est_rental_per": 144 },
                    { "name": "Glycel", "est_flow": 1840, "est_flow_per": 115, "est_revenue": 465290, "est_revenue_per": 119, "est_rental": 278300, "est_rental_per": 121 },
                    { "name": "IPSA", "est_flow": 1890, "est_flow_per": 105, "est_revenue": 548080, "est_revenue_per": 104, "est_rental": 310000, "est_rental_per": 100 },
                    { "name": "Mannings", "est_flow": 18471, "est_flow_per": 131, "est_revenue": 657800, "est_revenue_per": 110, "est_rental": 446200, "est_rental_per": 97 },
                ]
            },

            "lv2_org": {
                "est_ttl_visitors": 100000,
                "shops": [
                    { "name": "AAA", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "BBB", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "CCCC", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "DDD", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "E", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "F", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "G", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "H", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                ]
            },
            "lv2_upt": {
                "est_ttl_visitors": 150000,
                "shops": [
                    { "name": "AA", "est_flow": 77777, "est_flow_per": 10, "est_revenue": 109, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 10 },
                    { "name": "BB", "est_flow": 66666, "est_flow_per": 10, "est_revenue": 10987, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 20 },
                    { "name": "CC", "est_flow": 55555, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 30 },
                    { "name": "DD", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 40 },
                    { "name": "EE", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 50 },
                    { "name": "FF", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": -20 },
                    { "name": "GG", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": -20 },
                    { "name": "HH", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": -20 },
                ]
            },

            "lv3_org": {
                "est_ttl_visitors": 100000,
                "shops": [
                    { "name": "A", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "B", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "C", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "D", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "E", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "F", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "G", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "H", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                ]
            },
            "lv3_upt": {
                "est_ttl_visitors": 150000,
                "shops": [
                    { "name": "AA", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 20 },
                    { "name": "BB", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 10 },
                    { "name": "CC", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 30 },
                    { "name": "DD", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 40 },
                    { "name": "EE", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 50 },
                    { "name": "FF", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": -60 },
                    { "name": "GG", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": -20 },
                    { "name": "HH", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 20 },
                ]
            },

            "lv4_org": {
                "est_ttl_visitors": 100000,
                "shops": [
                    { "name": "A", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "B", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "C", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "D", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "E", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "F", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "G", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                    { "name": "H", "est_flow": 80000, "est_revenue": 1900, "est_rental": 80000 },
                ]
            },
            "lv4_upt": {
                "est_ttl_visitors": 150000,
                "shops": [
                    { "name": "AA", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 20 },
                    { "name": "BB", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 22 },
                    { "name": "CC", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": -12.5 },
                    { "name": "DD", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 4 },
                    { "name": "EE", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 8 },
                    { "name": "FF", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 11 },
                    { "name": "GG", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": -14 },
                    { "name": "HH", "est_flow": 800000, "est_flow_per": 10, "est_revenue": 1900, "est_revenue_per": 10, "est_rental": 80000, "est_rental_per": 10 },
                ]
            },
        };


        function updateData(lv_type) {
            //console.log("lv_type: " + lv_type);

            var last3Char = lv_type.slice(-3); // "org";
            //console.log("last3Char: " + last3Char);

            var arr = eval("est_data." + lv_type);

            var est_ttl_revenue = 0;
            var est_ttl_rental = 0;
            var est_ttl_visitors = eval("arr.est_ttl_visitors");
            //console.log(est_ttl_visitors);
            $("#ttl_visitors").text(addCommas(est_ttl_visitors));



            var display = "<table class='table table-striped'><tr>" +
                "<th scope='col'>Shop</th>" +
                "<th scope='col'>Shop Name</th>" +
                "<th scope='col'>Est. flow</th>" +
                "<th scope='col'>Est. Revenue</th>" +
                "<th scope='col'>Est. Rental</th>" +
                "</tr>";
            if (last3Char != "org") {
                display = "<table class='table table-striped'><tr>" +
                "<th scope='col'>Shop</th>" +
                "<th scope='col'>Shop Name</th>" +
                "<th scope='col'>Est. flow</th>" +
                "<th scope='col'>Est. flow %</th>" +
                "<th scope='col'>Est. Revenue</th>" +
                "<th scope='col'>Est. Revenue %</th>" +
                "<th scope='col'>Est. Rental</th>" +
                "<th scope='col'>Est. Rental %</th>" +
                "</tr>";
            }
            var shops = eval("arr.shops");
            //console.log(shops);
            for (var i = 0; i < shops.length; i++) {

                var name = shops[i].name;
                var est_flow = addCommas(shops[i].est_flow);
                var est_flow_per = 0;
                est_ttl_revenue += shops[i].est_revenue;
                var est_revenue = addCommas(shops[i].est_revenue);
                var est_revenue_per = 0;
                est_ttl_rental += shops[i].est_rental;
                var est_rental = addCommas(shops[i].est_rental);
                var est_rental_per = 0;
                if (last3Char != "org") {
                    est_flow_per = shops[i].est_flow_per;
                    if (est_flow_per > 0) {
                        est_flow_per = '<span class="up"><i class="fa fa-arrow-up" aria-hidden="true" style="margin-right: 3px;"></i>' + est_flow_per + '</span>';
                    }
                    else if (est_flow_per == 0) {
                        est_flow_per = est_flow_per;
                    }
                    else {
                        est_flow_per = est_flow_per * -1;
                        est_flow_per = '<span class="down"><i class="fa fa-arrow-down" aria-hidden="true" style="margin-right: 3px;"></i>' + est_flow_per + '</span>';
                    }

                    est_revenue_per = shops[i].est_revenue_per;
                    if (est_revenue_per > 0) {
                        est_revenue_per = '<span class="up"><i class="fa fa-arrow-up" aria-hidden="true" style="margin-right: 3px;"></i>' + est_revenue_per + '</span>';
                    }
                    else if (est_revenue_per == 0) {
                        est_revenue_per = est_revenue_per;
                    }
                    else {
                        est_revenue_per = est_revenue_per * -1;
                        est_revenue_per = '<span class="down"><i class="fa fa-arrow-down" aria-hidden="true" style="margin-right: 3px;"></i>' + est_revenue_per + '</span>';
                    }

                    est_rental_per = shops[i].est_rental_per;
                    if (est_rental_per > 0) {
                        est_rental_per = '<span class="up"><i class="fa fa-arrow-up" aria-hidden="true" style="margin-right: 3px;"></i>' + est_rental_per + '</span>';
                    }
                    else if (est_rental_per == 0) {
                        est_rental_per = est_rental_per;
                    }
                    else {
                        est_rental_per = est_rental_per * -1;
                        est_rental_per = '<span class="down"><i class="fa fa-arrow-down" aria-hidden="true" style="margin-right: 3px;"></i>' + est_rental_per + '</span>';
                    }
                    display += '<tr class="tr_lv' + (i + 1) + '">' +
                               '<td class="td_shop">L<span class="floor">' + currfloor + '</span>-0' + (i + 1) + ':' +
                               '</td>' +
                               '<td class="td_name">' + name + '</td>' +
                               '<td class="td_flow">' + est_flow + '</td>' +
                               '<td class="td_flow_per">' + est_flow_per + '</td>' +
                               '<td class="td_revenue">' + est_revenue + '</td>' +
                               '<td class="td_revenue_per">' + est_revenue_per + '</td>' +
                               '<td class="td_rental">' + est_rental + '</td>' +
                               '<td class="td_rental_per">' + est_rental_per + '</td>' +
                               '</tr>';
                }
                else {
                    display += '<tr class="tr_lv' + (i + 1) + '">' +
                    '<td class="td_shop">L<span class="floor">' + currfloor + '</span>-0' + (i + 1) + ':' +
                    '</td>' +
                    '<td class="td_name">' + name + '</td>' +
                    '<td class="td_flow">' + est_flow + '</td>' +
                    '<td class="td_revenue">' + est_revenue + '</td>' +
                    '<td class="td_rental">' + est_rental + '</td>' +
                    '</tr>';
                }                
            }
            display += "</table>";
            $("#shops_estimate").html(display);

            $("#ttl_revenue").text(addCommas(est_ttl_revenue));
            $("#ttl_rental").text(addCommas(est_ttl_rental));

        }

        $(".draggable").draggable({
            revert: true
        });

        $("#droppable").droppable({
            // the activeClass option specifies the class to add to
            // the droppable when it is a possible candidate for
            // a draggable element
            activeClass: "active",

            // here we specify the function to be run when the drop event
            // is triggered.
            drop: function (event, ui) {

                $("#loading").show();
                setTimeout(function () {
                    $("#loading").hide();

                    var callname = "lv" + currfloor + "_upt";
                    if (currCategory == "list1_foo" && currfloor == 1) {
                        callname = "lv1_upt" + demoState;
                    }
                    console.log('callname: ' + callname);

                    //Update data only
                    updateData(callname);

                    //Update image
                    $("#droppable").css("background-image", "url(/Images/" + callname + ".jpg)");

                    //$(this).html(ui.draggable.text());
                    var selectedText = ui.draggable.text();
                    $("#shops_estimate .tr_lv1 .td_name").text(selectedText);

                }, 1500);
            }
        });

        $(function () {
            updateData("lv1_org");
            $(".floor").text("1"); // default setting
            $("#droppable").css("background-image", "url(/Images/lv" + currfloor + "_org.jpg)");
        });
    </script>
</asp:Content>
