<%@ Page Title="Records" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Records.aspx.cs" Inherits="RHWebProject.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Records</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="PersonId">
       <Columns>
            <asp:BoundField DataField="PersonId" HeaderText="Person Id" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth" DataFormatString="{0:d}" />
            <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" />
        </Columns>
    </asp:GridView>
</asp:Content>
