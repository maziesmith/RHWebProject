<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RHWebProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="//code.jquery.com/jquery-1.10.2.js"></script>
        <h2>Please enter the details</h2>
    <p>&nbsp;</p>
    <div class="lead">
        First Name:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="First Name is Required">*</asp:RequiredFieldValidator>
        <br />
        Last Name:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        Date of Birth:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Enter a date in the format m/d/yyyy" OnServerValidate="CustomValidator1_ServerValidate" ClientValidationFunction="validateDate">Invalid date format (requires m/d/yyyy).</asp:CustomValidator>
        <br />
        Email Address:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </div>
    <asp:Button ID="submitbtnId" OnClick="submitbtnId_Click" Text="Submit Now" runat="server"/>
    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    
    <script type="text/javascript">
        function validateDate(oSrc, args) {
            var iDay, iMonth, iYear;
            var arrValues;
            arrValues = args.Value.split("/");
            iMonth = arrValues[0];
            iDay = arrValues[1];
            iYear = arrValues[2];

            var testDate = new Date(iYear, iMonth - 1, iDay);
            if ((testDate.getDate() != iDay) ||
                (testDate.getMonth() != iMonth - 1) ||
                (testDate.getFullYear() != iYear)) {
                args.IsValid = false;
                return;
            }

            return true;
        }
    </script>
</asp:Content>