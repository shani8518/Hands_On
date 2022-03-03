<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Newel Technologies</title>
    <style>
        * {
            padding :0;
            font-family:Arial;
            font-size:14px;
            margin-left: 0;
            margin-right: 0;
            margin-bottom: 0;
        }
        b {
            margin:20px 25px;
        }
        #GridView1
        {
            margin:15px 30px
        }
.t1{
    padding: 12px;
}
        #ddlDept {
            border:3px solid green
        }
        #txtEmpCode, #txtName, #txtBod, #txtJoiningDate, #txtExp, #txtSal, #txtAddress {
            border:2px solid #000;
        }
#div1 {
    margin: 15px 45px;
    border: 1px solid #000;
    width:720px;
    height:580px
}
        #div2 {
            margin: 25px 50px;
            border: 1px solid #000;
            width: 920px;
            height: auto;
        }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="div1">
        <b>Add Employee</b>
        <table>
            <tr>
                <td  class="t1">Emp Code</td>
                <td  class="t1">
                    <asp:TextBox ID="txtEmpCode" runat="server"></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Emp Code" ForeColor="Red" ControlToValidate="txtEmpCode" SetFocusOnError="True" ValidationExpression="[a-zA-Z0-9]*$"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td  class="t1">Name</td>
                <td  class="t1">
                    <asp:TextBox ID="txtName" runat="server" Width="250px"></asp:TextBox></td>
            </tr>
            <tr>
                <td  class="t1">Department</td>
                <td  class="t1">
                    <asp:DropDownList ID="ddlDept" runat="server" AutoPostBack="True" Height="32px" Width="150px">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                        <asp:ListItem>Technology</asp:ListItem>
                        <asp:ListItem>Account</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td  class="t1">Gender</td>
                <td  class="t1"><asp:RadioButton ID="rdMale" Text="Male" runat="server" GroupName="gender"/>
            <asp:RadioButton ID="rdFemale" Text="Female" runat="server" GroupName="gender" /></td>
            </tr>
            <tr>
                <td  class="t1">BOD </td>
                <td  class="t1">
                    <asp:TextBox ID="txtBod" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="imgBod" runat="server" ImageUrl="~/Img/Cal.jpg" Width="16px" OnClick="imgBod_Click" />
                    <asp:Calendar ID="calBod" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" OnSelectionChanged="calBod_SelectionChanged" Width="220px" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td  class="t1">Joining Date </td>
                <td  class="t1">
                    <asp:TextBox ID="txtJoiningDate" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="imgJoiningDate" runat="server" Height="16px" ImageUrl="~/Img/Cal.jpg" OnClick="imgJoiningDate_Click" Width="16px" />
                    <asp:Calendar ID="calJoiningDate" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="calJoiningDate_SelectionChanged" ShowGridLines="True" Width="220px">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar></td>
            </tr>
            <tr>
                <td  class="t1">Prev Exprience</td>
                <td  class="t1">
                    <asp:TextBox ID="txtExp" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td  class="t1">Salary</td>
                <td  class="t1">
                    <asp:TextBox ID="txtSal" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td valign="top" class="t1">Address</td>
                <td  class="t1">
                    <asp:TextBox ID="txtAddress" runat="server" Height="75px" TextMode="MultiLine" Width="250px" ></asp:TextBox></td>
            </tr>
            <tr>
                <td  class="t1"><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" /></td>
                <td  class="t1"><asp:Button ID="btnCalcel" runat="server" Text="Calcel" OnClick="btnCalcel_Click" /></td>
            </tr>
        </table>
    </div>
        <div id="div2">
            <b>Details</b>
            <asp:GridView ID="GridView1" runat="server" Visible="False" AutoGenerateColumns="False" DataKeyNames="Emp_Code" DataSourceID="SqlDataSource1" Width="835px" CellPadding="4" ForeColor="#333333" GridLines="Vertical" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Emp_Code" HeaderText="Emp Code" ReadOnly="True" SortExpression="Emp_Code" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="BOD" HeaderText="BOD" SortExpression="BOD" />
                <asp:BoundField DataField="JoiningDate" HeaderText="Joining Date" SortExpression="JoiningDate" />
                <asp:BoundField DataField="PreExp" HeaderText="Prev Exp" SortExpression="PreExp" />
                <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="Update [Employee] Set [Name]=@Name, [Department]=@Department, [Gender]=@Gender, [BOD]=@BOD, [JoiningDate]=@JoiningDate, [PreExp]=@PreExp, [Salary]=@Salary, [Address]=@Address where [Emp_Code]=@Emp_Code"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>