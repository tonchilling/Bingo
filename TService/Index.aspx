<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="TService.Index" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head><title>
	Home Page
</title>
      <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
     <link href="Styles/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Styles/sweetalert.css" rel="stylesheet" />

    <script src="Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="Scripts/sweetalert.js"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>

    
    <script type="text/javascript">
         

        var currentURL = "api/BingGO"
        var dataList = null;
        $(document).ready(function () {

          
            InitalData();


            $('#login-form-link').click(function (e) {
                $(".pnl1").delay(100).fadeIn(100);
                $(".pnl2").fadeOut(100);
                $('#register-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });
            $('#register-form-link').click(function (e) {
                $(".pnl2").delay(100).fadeIn(100);
                $(".pnl1").fadeOut(100);
                $('#login-form-link').removeClass('active');
                $(this).addClass('active');
                e.preventDefault();
            });



            $('.btnRefresh').click(function (e) {
                InitalData();
            });
            

        });





        function BAlert(title, content,type) {
            setTimeout(function () {
                swal({
                    title: title,
                    text: content,
                    type: type!=null?type:"success",
                    showCancelButton: false,
                    confirmButtonClass: "btn-success",
                    confirmButtonText: "Yes",
                    closeOnConfirm: false
                })
            }, 700);
            //  $.alert({title: title,content: content,type: 'green',animation: "RotateX",typeAnimated: true});

        }



        function InitalData()
        {

          

            var html = '';


            var data;





            $(".pnl1").delay(100).fadeIn(100);
            $(".pnl2").fadeOut(100);
            $('#register-form-link').removeClass('active');
            $('#login-form-link').addClass('active');
           

                $('.divMainTable').empty();

                html += '';
                html += '<table class=" table table-bordered" id="dataTable" width="100%" cellspacing="0">';
           

                html += '<tbody>';
                $.ajax({
                    url: currentURL+"/GetData",
                    type: "Get",
                    data: data,
                    contentType: false,
                    processData: false,
                    success: function (result) {


                       
                        dataList = result
                        var row = 1;

                        $.each(dataList, function (key, item) {

                            html += '<td class="cell cell' + (row-1) + '">' + item.Number + '</td>';
                            if ((row % 5) == 0) {
                                html += '</tr>';
                                html += '<tr>';
                            }
                            row++;
                        });
                        html += '</tbody>';
                        html += '</table>';

                        $('.divMainTable').append(html);
                      


                        //   $('.chkStatusView').bootstrapToggle()



                        //  event.stopPropagation();
                    },
                    error: function (err) {

                        //  alert(err)
                    }
                });

        }



        $(document).on('click', ".btnAdd", function (event) {
            

            var html = '';
            

            html+=' <div class="row" style="padding-top:10px;">';
            html+='<div class="col-sm-12">';
            html+='<div class="input-group">';
            html+='<span class="input-group-addon">Number</span>';
            html+='<input id="msg" type="text" class="form-control txtNumber" name="msg" placeholder="">';
            html+='</div>';
            html+='</div>';
            html += '</div>';

            $('.txtboxPanel').append(html);

        });

        $(document).on('click', ".btnCheck", function (event) {

            var data = {}
            var isValid = true;

            var inputData = {};
            var SelectNumber = [];

           
         
            $('.txtNumber').each(function (i, obj) {
                SelectNumber.push($(this).val());
            });


            

            inputData.SelectNumber = SelectNumber;
          
            inputData.dataList = dataList;


            if (isValid) {




                $.ajax({
                    url: currentURL + "/CheckData",
                    type: "POST",
                    data: JSON.stringify(inputData),
                    contentType: "application/json",
                    success: function (result) {

                        
                        if (result != null)
                        {

                           


                            if (result.isValid) {

                                BAlert("BinGo", "ค๊าฟโผ๊มมม!!");
                            } else {

                                BAlert("Sorry", "บ่ถวกค๊าฟ!!", "warning");
                            }
                            $('.cell').removeClass("bg-primary");
                            if (result.position != null)
                            {
                              
                                $.each(result.position, function (key, position) {

                                   
                                    $('.cell' + position).addClass("bg-primary");

                                });

                            }

                        }

                       

                    },
                    error: function (err) {
                        alert(err.statusText)
                    }
                });
            }

        });
    
    </script>

</head>
<body>
    <form method="post" action="./Default.aspx" id="ctl01">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTY1NDU2MTA1MmRkmOQYr3pgOGSrNZopvXTWc5SxERV0sdf1c0ZI4SUMriY=" />
</div>


<script src="/WebResource.axd?d=Vzzkka9a1icMCg29Hmh83_DN7YBKKpHtjnGIr1bHsKHXTla1GwD4Q7tD5QdYe_mlZVJrtt0WwQ_rtWs85ekVMgY_rZNcWVDSlZ7lHFP-g3M1&amp;t=635823526080000000" type="text/javascript"></script>

     <div class="container">
<div class="panel panel-primary">
       <div class="panel-heading">
            <div class="title">
                <h1>
                 <i class="fa fa-cog fa-spin fa-2x" style="color:#007bff"></i> Bingo
                </h1>
            </div>
            <div class="loginDisplay">
                
                    <input type="button" class="btn btn-warning btnRefresh" value="Refresh" />
                    
            </div>
            <div class="clear hideSkiplink">
              
                  <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"> Create Mr.Piyaphon Kaewtap</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
            
            </ul>
           
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
            </div>
        </div>
    

      <div class="panel-body">




          <div class="container">
    	<div class="row">
			<div class="col-md-11">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Bingo</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Formula Calculation</a>
							</div>
						</div>
						<hr>
					</div>
					<div class=" pnl1">
						<div class="row">
							<div class="col-lg-12">
								   <div class="panel-body ">
            

     <div class="row">
        
         <div class="col-sm-4">
             
              <div class="row">
                  <div class="col-sm-12">
         <div class="input-group">
    <span class="input-group-addon">Number</span>
    <input id="msg" type="text" class="form-control txtNumber" name="msg" placeholder="">
  </div>
                      </div>
               </div>
             <div class="txtboxPanel">


             </div>
         </div>
          <div class="col-sm-4">
          <input type="button" class="btn btn-primary btnAdd" value="Add Number" />   <input type="button" class="btn btn-success btnCheck" value="CHECKING" />
          </div>
     </div>
  
	<div class="row" style="padding-top:10px;">
    <div class="col-sm-10">
        <div class="divMainTable">
		<table class="table table-bordered tblMain">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
            </div>
  </div>
	</div>



        </div>
						
							</div>
						</div>
					</div>

                    	<div class=" pnl2">
                            <div class="row">

                                <div class="col-sm-1"></div>
							<div class="col-sm-5">
                          
                            <div class="form-group">
										<input type="text" tabindex="1" class="form-control txtInput" placeholder="Input" value="">
									</div>
									
                                </div>
                                <div class="col-sm-3">
                          
                            <div class="form-group">
										<input type="text" tabindex="1" class="form-control txtOutput" placeholder="Output" value="">
									</div>
									
                                </div>
                               <div class="col-sm-2">

                                   <input type="button" class="btn btn-success btnCal" value="CHECKING" />
                               </div>
                                </div>
                    	</div>
				</div>
			</div>
		</div>
	</div>



      </div>

    <div class="footer">
        
    </div>

    </div>

    </div>




   
</body>
</html>

