<%@ Page Title="My Profile - BloodConnect" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="userpanel.aspx.cs" Inherits="website_blood.userpanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Google Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.4/font/bootstrap-icons.css" rel="stylesheet" />

    <style>
        :root {
            --bc-red: #E63950;
            --bc-red-dark: #C81E37;
            --bc-navy: #1F2937;
            --bc-gray: #6B7280;
            --bc-bg: #F4F6F9;
            --bc-border: #E5E7EB;
            --bc-green: #16A34A;
            --bc-green-bg: #DCFCE7;
            --bc-red-badge: #DC2626;
            --bc-red-badge-bg: #FEE2E2;
            --bc-white: #FFFFFF;
            --radius: 16px;
        }

        body {
            background-color: var(--bc-bg);
            font-family: 'Poppins', sans-serif;
        }

        /* Custom In-Page Navigation Header */
        .up-navbar-container {
            background: #ffffff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }

        .up-navbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 14px 0;
        }

        .up-brand {
            font-size: 22px;
            font-weight: 800;
            color: #DC2626;
            text-decoration: none;
        }

        .up-nav-links {
            display: flex;
            align-items: center;
            gap: 18px;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .up-nav-link {
            color: #4B5563;
            font-weight: 500;
            font-size: 14px;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .up-nav-link:hover, .up-nav-link.active {
            color: #DC2626;
            font-weight: 600;
        }

        .up-btn-logout {
            border: 1.5px solid #DC2626;
            color: #DC2626;
            background: transparent;
            padding: 6px 18px;
            font-size: 13px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .up-btn-logout:hover {
            background: #DC2626;
            color: #ffffff;
        }

        /* Main Profile Layout */
        .up-wrapper {
            max-width: 960px;
            margin: 0 auto 40px auto;
            padding: 0 20px;
            color: var(--bc-navy);
        }

        .up-header-title {
            font-size: 32px;
            font-weight: 800;
            margin-bottom: 4px;
            color: #111827;
        }

        .up-header-sub {
            color: var(--bc-gray);
            font-size: 15px;
            margin-bottom: 28px;
        }

        /* Cards */
        .up-card {
            background: var(--bc-white);
            border: 1px solid var(--bc-border);
            border-radius: var(--radius);
            padding: 32px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
            margin-bottom: 28px;
        }

        .up-card-title {
            font-size: 22px;
            font-weight: 800;
            margin-bottom: 24px;
            color: #111827;
        }

        /* Form Controls */
        .up-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        @media (max-width: 640px) {
            .up-grid { grid-template-columns: 1fr; }
            .up-nav-links { display: none; }
        }

        .up-field { margin-bottom: 8px; }

        .up-label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 8px;
            color: #111827;
        }

        .up-input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid var(--bc-border);
            border-radius: 10px;
            font-size: 14px;
            background: #fff;
            color: var(--bc-navy);
            outline: none;
            box-sizing: border-box;
        }

        .up-input:focus { border-color: var(--bc-red); }

        .up-input[readonly] {
            background-color: #F9FAFB;
            color: #6B7280;
        }

        /* Actions */
        .up-actions {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        .up-btn-save {
            background: var(--bc-red);
            color: #fff;
            border: none;
            padding: 12px 28px;
            font-weight: 700;
            font-size: 14px;
            border-radius: 10px;
            cursor: pointer;
            transition: background 0.2s ease;
        }

        .up-btn-save:hover { background: var(--bc-red-dark); }

        .up-btn-donor-panel {
            background-color: #1F2937;
            color: #ffffff;
            border: none;
            padding: 12px 24px;
            font-weight: 700;
            font-size: 14px;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background 0.2s ease;
        }

        .up-btn-donor-panel:hover {
            background-color: #111827;
            color: #ffffff;
        }

        .up-btn-become-donor {
            background-color: #2563EB;
            color: #ffffff;
            border: none;
            padding: 12px 24px;
            font-weight: 700;
            font-size: 14px;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            transition: background 0.2s ease;
        }

        .up-btn-become-donor:hover {
            background-color: #1D4ED8;
            color: #ffffff;
        }

        .up-msg-success {
            color: var(--bc-green);
            font-weight: 700;
            font-size: 14px;
        }

        /* Table */
        .up-table-container {
            width: 100%;
            overflow-x: auto;
        }

        .up-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        .up-table th {
            text-align: left;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #9CA3AF;
            padding: 12px 16px;
            border-bottom: 1px solid var(--bc-border);
        }

        .up-table td {
            padding: 18px 16px;
            border-bottom: 1px solid var(--bc-border);
            vertical-align: middle;
            color: #374151;
            font-weight: 500;
        }

        .up-table tr:last-child td { border-bottom: none; }

        /* Badges */
        .up-badge {
            display: inline-block;
            font-size: 12px;
            font-weight: 700;
            padding: 4px 14px;
            border-radius: 999px;
        }

        .up-badge-pending {
            background: var(--bc-red-badge-bg);
            color: var(--bc-red-badge);
        }

        .up-badge-fulfilled {
            background: var(--bc-green-bg);
            color: var(--bc-green);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- NAVIGATION HEADER -->
    <div class="up-navbar-container sticky-top">
        <div class="container">
            <div class="up-navbar">
                <a href="index.aspx" class="up-brand">BloodConnect</a>
                <ul class="up-nav-links">
                    <li><a href="index.aspx" class="up-nav-link">Home</a></li>
                    <li><a href="search-blood.aspx" class="up-nav-link">Search Blood</a></li>
                    <li><a href="hospitals.aspx" class="up-nav-link">Hospitals</a></li>
                    <li><a href="become-donor.aspx" class="up-nav-link">Become Donor</a></li>
                    <li><a href="request-blood.aspx" class="up-nav-link">Request Blood</a></li>
                    <li><a href="emergency.aspx" class="up-nav-link">Emergency</a></li>
                    <li><a href="about.aspx" class="up-nav-link">About</a></li>
                    <li><a href="contact.aspx" class="up-nav-link">Contact</a></li>
                    <li><a href="userpanel.aspx" class="up-nav-link active">My Profile</a></li>
                    <li>
                        <asp:LinkButton ID="btnNavLogout" runat="server" CssClass="up-btn-logout" OnClick="btnLogout_Click">Logout</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- MAIN CONTENT -->
    <div class="up-wrapper">
        <h1 class="up-header-title">My Profile</h1>
        <p class="up-header-sub">Manage your account details and request history.</p>

        <!-- CARD 1: PROFILE DETAILS -->
        <div class="up-card">
            <div class="up-grid">
                <div class="up-field">
                    <label class="up-label">Full Name</label>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="up-input"></asp:TextBox>
                </div>
                <div class="up-field">
                    <label class="up-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="up-input" ReadOnly="true"></asp:TextBox>
                </div>
                <div class="up-field">
                    <label class="up-label">Contact Number</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="up-input"></asp:TextBox>
                </div>
                <div class="up-field">
                    <label class="up-label">City</label>
                    <asp:TextBox ID="txtCity" runat="server" CssClass="up-input"></asp:TextBox>
                </div>
            </div>

            <div class="up-actions">
                <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="up-btn-save" OnClick="btnSave_Click" />
                
                <!-- Conditionally Visible Buttons based on Donor Status in tbl_Donors -->
                <asp:HyperLink ID="lnkDonorPanel" runat="server" NavigateUrl="~/donorpanel.aspx" CssClass="up-btn-donor-panel" Visible="false">
                    <i class="bi bi-person-badge-fill"></i> Donor Details
                </asp:HyperLink>
                
                <asp:HyperLink ID="lnkBecomeDonor" runat="server" NavigateUrl="~/become-donor.aspx" CssClass="up-btn-become-donor" Visible="false">
                    <i class="bi bi-plus-circle-fill"></i> Become a Donor
                </asp:HyperLink>

                <asp:Label ID="lblMsg" runat="server" CssClass="up-msg-success" Visible="false">Changes saved</asp:Label>
            </div>
        </div>

        <!-- CARD 2: BLOOD REQUESTS -->
        <div class="up-card">
            <h2 class="up-card-title">My Blood Requests</h2>
            <div class="up-table-container">
                <asp:GridView ID="gvRequests" runat="server" CssClass="up-table" AutoGenerateColumns="False" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="RequestDate" HeaderText="DATE" DataFormatString="{0:dd-MMM-yyyy}" />
                        <asp:BoundField DataField="BloodGroup" HeaderText="BLOOD GROUP" />
                        <asp:BoundField DataField="Hospital" HeaderText="HOSPITAL" />
                        <asp:TemplateField HeaderText="STATUS">
                            <ItemTemplate>
                                <span class='<%# Eval("Status").ToString() == "Approved" || Eval("Status").ToString() == "Fulfilled" ? "up-badge up-badge-fulfilled" : "up-badge up-badge-pending" %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div style="padding: 15px; text-align: center; color: #6B7280; font-weight: 500;">
                            No blood requests found.
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Hide duplicate header elements from Master Page if present
            var masterHeader = document.querySelector('header');
            if (masterHeader && masterHeader.parentElement !== document.querySelector('.up-navbar-container')) {
                masterHeader.style.display = 'none';
            }
        });
    </script>
</asp:Content>