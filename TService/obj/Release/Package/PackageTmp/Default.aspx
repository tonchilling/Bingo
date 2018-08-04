<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script>

        var currentURL = "http://localhost:1778/api/BingGO"

        $(document).ready(function () {

          
            InitalData();
        });



        function InitalData()
        {

            function Search() {

                var html = '';



                var formData = new FormData();
                formData.append("Action", "Search");
                // formData.append("Name", $(".txtNameSearch").val());
                // formData.append("Status", $(".selectStatus").val());
                $('.divMainTable').empty();

                html += '';
                html += '<table class="datatable row-border hover table" id="dataTable" width="100%" cellspacing="0">';
                html += '<thead>';
                html += '<tr>';
                html += '<th>No.</th>';
                html += '<th>Full Name</th>';
                html += '<th>Customer Login</th>';
                html += '<th>Code</th>';
                html += '<th>Create Date</th>';
                html += '<th>Active</th>';
                html += '<th>View</th>';
                html += '<th>Delete</th>';
                html += '</tr>';
                html += '</thead>';
                html += '<tfoot>';
                html += '<tr>';
                html += '<th>No.</th>';
                html += '<th>Full Name</th>';
                html += '<th>User Login</th>';
                html += '<th>Code</th>';
                html += '<th>Create Date</th>';
                html += '<th>Active</th>';
                html += '<th>View</th>';
                html += '<th>Delete</th>';
                html += '</tr>';
                html += '</tfoot>';

                html += '<tbody>';
                $.ajax({
                    url: currentURL,
                    type: "Get",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (result) {



                        var obj = JSON.parse(result)
                        var row = 1;

                        $.each(obj, function (key, item) {

                            html += '<tr  data="' + item.CustID + '">';
                            html += '<td>' + row + '</td>';
                            html += '<td>' + item.FullNameTH + '</td>';
                            html += '<td>' + item.UserLogin + '</td>';
                            html += '<td>' + item.CustCode + '</td>';
                            html += '<td>' + item.UpdateDate + '</td>';
                            html += '<td> <label class="custom-control custom-checkbox">' + (item.Status == '1' ? '<input class="custom-control-input" type="checkbox" checked disabled>'
                            : '<input class="custom-control-input" type="checkbox" disabled>');
                            html += '<span class="custom-control-indicator custom-control-indicator-success"></span> </label></td>'
                            /*  html += '<td class="text-center">' + (item.Status == '1' ? '<i class="fa fa-battery-full fa-2x" aria-hidden="true" style=" color:#94f26f"></i>'
                                                                   : '<i class="fa fa-battery-empty fa-2x" aria-hidden="true" style=" color:red"></i>') + '</td>';*/

                            html += '<td>' + '<i class="fa fa-desktop success fa-2x btnEdit"></i>' + '</td>';
                            html += '<td>' + '<i class="fa fa-minus-circle danger fa-2x btnDelete"></i>' + '</td>';
                            html += '</tr>';
                            row++;
                        });
                        html += '</tbody>';
                        html += '</table>';

                        $('.divMainTable').append(html);
                        $('.divMainTable table').DataTable({

                            dom: 'Bfrtip'
                            // searching: false

                        });


                        //   $('.chkStatusView').bootstrapToggle()



                        //  event.stopPropagation();
                    },
                    error: function (err) {

                        //  alert(err)
                    }
                });

            }
        }
    </script>

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 
 <div class="container">
	<div class="row">
    <div class="col-sm-8">
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
</asp:Content>
