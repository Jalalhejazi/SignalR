﻿<%@ Page Title="ASP.NET SignalR: Simple Streaming" Language="C#" MasterPageFile="~/SignalR.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Microsoft.AspNet.SignalR.Samples.Streaming.Default" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="<%: ResolveUrl("~/") %>">SignalR Samples</a> <span class="divider">/</span></li>
        <li class="active">Simple Streaming</li>
    </ul>

    <div class="page-header">
        <h2>Simple Streaming <small>Broadcasting to connected clients</small></h2>
        <p>A simple example of a background thread that broadcasts the server time to all connected clients every two seconds.</p>
    </div>

    <h4>Streaming Messages</h4>
    <ul id="messages">
    </ul>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        $(function () {
            var connection = $.connection('/streaming-connection');

            connection.logging = true;

            connection.received(function (data) {
                $('#messages').append('<li>' + data + '</li>');
            });

            connection.start({ transport: activeTransport });
        });
    </script>
</asp:Content>
