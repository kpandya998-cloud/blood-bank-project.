<%@ Page Title="Admin Panel - BloodConnect" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="adminpanel.aspx.cs" Inherits="website_blood.adminpanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --bc-red: #D92D20;
            --bc-red-hover: #B52216;
            --bc-red-dark: #841910;
            --bc-red-light: #FEE4E2;
            --bc-navy: #0F172A;
            --bc-text-body: #334155;
            --bc-gray: #64748B;
            --bc-bg: #F8FAFC;
            --bc-card-bg: #FFFFFF;
            --bc-border: #E2E8F0;
            --bc-border-hover: #CBD5E1;
            --bc-green: #15803D;
            --bc-green-bg: #DCFCE7;
            --bc-amber: #B45309;
            --bc-amber-bg: #FEF3C7;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.07);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.08);
            --radius-md: 10px;
            --radius-lg: 16px;
            --transition: all 0.2s ease-in-out;
        }

        * { box-sizing: border-box; }
        body { margin: 0; font-family: 'Plus Jakarta Sans', 'Inter', sans-serif; background: var(--bc-bg); color: var(--bc-text-body); }
        a { text-decoration: none; color: inherit; }

        .bc-topbar { 
            background: var(--bc-card-bg); 
            border-bottom: 1px solid var(--bc-border); 
            display: flex; 
            align-items: center; 
            justify-content: space-between; 
            padding: 14px 32px; 
            position: sticky; 
            top: 0; 
            z-index: 100; 
            box-shadow: var(--shadow-sm);
        }
        .bc-topbar-left { display: flex; align-items: center; gap: 16px; }
        .bc-logo { font-size: 22px; font-weight: 800; color: var(--bc-red); letter-spacing: -0.5px; }
        
        .bc-topbar-right { display: flex; align-items: center; gap: 14px; }
        .bc-role-badge { background: var(--bc-green-bg); color: var(--bc-green); font-size: 11.5px; font-weight: 700; padding: 4px 10px; border-radius: 999px; letter-spacing: 0.03em; }
        .bc-user-chip { display: flex; align-items: center; gap: 9px; font-weight: 600; font-size: 14px; color: var(--bc-navy); }
        .bc-avatar { width: 34px; height: 34px; border-radius: 50%; background: var(--bc-red); color: #fff; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 14px; }

        .bc-shell { display: flex; min-height: calc(100vh - 65px); }
        .bc-sidebar { width: 240px; background: var(--bc-card-bg); border-right: 1px solid var(--bc-border); padding: 22px 14px; flex-shrink: 0; }
        .bc-nav-section { font-size: 11px; text-transform: uppercase; color: var(--bc-gray); font-weight: 700; margin: 18px 10px 8px; letter-spacing: .06em; }
        
        .bc-nav-link { 
            display: flex; 
            align-items: center; 
            gap: 10px; 
            padding: 11px 14px; 
            border-radius: var(--radius-md); 
            font-size: 14px; 
            font-weight: 600; 
            color: var(--bc-navy); 
            margin-bottom: 4px; 
            cursor: pointer; 
            border: none; 
            background: none; 
            width: 100%; 
            text-align: left; 
            font-family: inherit; 
            transition: var(--transition);
        }
        .bc-nav-link:hover { background: var(--bc-red-light); color: var(--bc-red); transform: translateX(3px); }
        .bc-nav-link.active { background: var(--bc-red); color: #fff; box-shadow: 0 4px 12px rgba(217, 45, 32, 0.25); }

        .bc-main { flex: 1; padding: 28px 36px; }
        .bc-pill { display: inline-block; background: var(--bc-red-light); color: var(--bc-red); font-size: 12px; font-weight: 700; padding: 5px 12px; border-radius: 999px; margin-bottom: 10px; }
        .bc-page-head { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 24px; flex-wrap: wrap; gap: 12px; }
        .bc-page-title { font-size: 28px; font-weight: 800; margin: 0; color: var(--bc-navy); letter-spacing: -0.5px; }
        .bc-page-sub { color: var(--bc-gray); font-size: 14px; margin-top: 4px; }

        .bc-btn { 
            display: inline-flex; 
            align-items: center; 
            justify-content: center; 
            gap: 6px; 
            border: none; 
            border-radius: var(--radius-md); 
            padding: 10px 18px; 
            font-weight: 700; 
            font-size: 13.5px; 
            cursor: pointer; 
            background: var(--bc-red); 
            color: #fff; 
            transition: var(--transition); 
            text-decoration: none;
            box-shadow: var(--shadow-sm);
        }
        .bc-btn:hover { background: var(--bc-red-hover); color: #fff; transform: translateY(-1.5px); box-shadow: var(--shadow-md); }
        .bc-btn-outline { background: #fff; color: var(--bc-red); border: 1.5px solid var(--bc-red); }
        .bc-btn-outline:hover { background: var(--bc-red-light); border-color: var(--bc-red); }
        .bc-btn-sm { padding: 7px 14px; font-size: 12.5px; border-radius: 8px; }
        .bc-btn-ghost { background: transparent; color: var(--bc-navy); border: 1.5px solid var(--bc-border); }
        .bc-btn-ghost:hover { background: #F1F5F9; border-color: var(--bc-border-hover); }

        .bc-card { background: var(--bc-card-bg); border: 1px solid var(--bc-border); border-radius: var(--radius-lg); padding: 22px; box-shadow: var(--shadow-sm); }
        .bc-card + .bc-card { margin-top: 20px; }

        .bc-stat-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 18px; margin-bottom: 24px; }
        .bc-stat-card { background: var(--bc-card-bg); border: 1px solid var(--bc-border); border-radius: var(--radius-lg); padding: 20px; transition: var(--transition); }
        .bc-stat-card:hover { transform: translateY(-3px); box-shadow: var(--shadow-md); }
        .bc-stat-label { font-size: 13px; color: var(--bc-gray); font-weight: 600; }
        .bc-stat-value { font-size: 28px; font-weight: 800; margin-top: 6px; color: var(--bc-navy); }
        .bc-stat-value.red { color: var(--bc-red); }

        .bc-field { margin-bottom: 16px; }
        .bc-label { display: block; font-size: 13px; font-weight: 700; margin-bottom: 6px; color: var(--bc-navy); }
        .bc-input, .bc-select { 
            width: 100%; 
            padding: 11px 13px; 
            border: 1.5px solid var(--bc-border); 
            border-radius: var(--radius-md); 
            font-size: 14px; 
            background: #fff; 
            color: var(--bc-navy); 
            font-family: inherit; 
            transition: var(--transition);
        }
        .bc-form-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 16px; }

        .bc-table { width: 100%; border-collapse: collapse; font-size: 14px; }
        .bc-table th { text-align: left; font-size: 12.5px; text-transform: uppercase; color: var(--bc-gray); padding: 10px 12px; border-bottom: 1.5px solid var(--bc-border); background: #F8FAFC; }
        .bc-table td { padding: 14px 12px; border-bottom: 1px solid var(--bc-border); vertical-align: middle; }

        .bc-badge { display: inline-block; font-size: 12px; font-weight: 700; padding: 4px 10px; border-radius: 999px; }
        .bc-badge-available { background: var(--bc-green-bg); color: var(--bc-green); }
        .bc-badge-limited { background: var(--bc-amber-bg); color: var(--bc-amber); }

        .bc-page-section { display: none; }
        .bc-page-section.active { display: block; }

        /* Stock Unit Tags */
        .bc-blood-unit-tag {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            background: #F1F5F9;
            border: 1px solid var(--bc-border);
            padding: 3px 8px;
            border-radius: 6px;
            font-size: 12px;
            margin-right: 5px;
            margin-bottom: 5px;
            font-weight: 600;
        }
        .bc-blood-unit-tag strong {
            color: var(--bc-red);
        }
        .bc-blood-unit-tag span {
            color: var(--bc-navy);
        }

        @media (max-width: 900px) {
            .bc-sidebar { display: none; }
            .bc-main { padding: 20px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- CLEAN ADMIN TOPBAR -->
    <div class="bc-topbar">
        <div class="bc-topbar-left">
            <a href="index.aspx" class="bc-logo">BloodConnect</a>
        </div>

        <div class="bc-topbar-right">
            <a href="index.aspx" class="bc-btn bc-btn-ghost bc-btn-sm">← Back to Main Website</a>
            <span class="bc-role-badge">ADMIN</span>
            <div class="bc-user-chip">
                <div class="bc-avatar"><asp:Literal ID="litAdminAvatar" runat="server">A</asp:Literal></div>
                <span><asp:Literal ID="litAdminName" runat="server">Admin User</asp:Literal></span>
            </div>
            <asp:LinkButton ID="btnLogout" runat="server" CssClass="bc-btn bc-btn-outline bc-btn-sm" OnClick="btnLogout_Click">Logout</asp:LinkButton>
        </div>
    </div>

    <!-- MAIN SHELL -->
    <div class="bc-shell">
        <div class="bc-sidebar">
            <div class="bc-nav-section">Overview</div>
            <button type="button" class="bc-nav-link active" data-page="dashboard">Dashboard</button>

            <div class="bc-nav-section">Management</div>
            <button type="button" class="bc-nav-link" data-page="donors">Donors</button>
            <button type="button" class="bc-nav-link" data-page="hospitals">Hospitals</button>
            <button type="button" class="bc-nav-link" data-page="requests">Blood Requests</button>
            <button type="button" class="bc-nav-link" data-page="users">Users</button>

            <div class="bc-nav-section">Account</div>
            <button type="button" class="bc-nav-link" data-page="settings">Settings</button>
        </div>

        <div class="bc-main">

            <!-- DASHBOARD -->
            <div class="bc-page-section active" id="page-dashboard">
                <div class="bc-page-head">
                    <div>
                        <span class="bc-pill">Emergency Blood Network</span>
                        <h1 class="bc-page-title">Admin Dashboard</h1>
                        <div class="bc-page-sub">Overview of donors, hospitals and live blood requests.</div>
                    </div>
                    <button type="button" class="bc-btn" data-goto="requests">Review Requests</button>
                </div>

                <div class="bc-stat-grid">
                    <div class="bc-stat-card">
                        <div class="bc-stat-label">Total Donors</div>
                        <div class="bc-stat-value"><asp:Literal ID="litTotalDonors" runat="server">0</asp:Literal></div>
                    </div>
                    <div class="bc-stat-card">
                        <div class="bc-stat-label">Registered Hospitals</div>
                        <div class="bc-stat-value"><asp:Literal ID="litTotalHospitals" runat="server">0</asp:Literal></div>
                    </div>
                    <div class="bc-stat-card">
                        <div class="bc-stat-label">Total Blood Requests</div>
                        <div class="bc-stat-value red"><asp:Literal ID="litPendingRequests" runat="server">0</asp:Literal></div>
                    </div>
                    <div class="bc-stat-card">
                        <div class="bc-stat-label">Units Available (All Cities)</div>
                        <div class="bc-stat-value"><asp:Literal ID="litUnitsAvailable" runat="server">0</asp:Literal></div>
                    </div>
                </div>

                <!-- HOSPITAL BLOOD GROUP STOCK BREAKDOWN SECTION -->
                <div class="bc-card" style="margin-bottom:20px;">
                    <div class="bc-page-head" style="margin-bottom:14px;">
                        <div>
                            <h3 style="margin:0;">Hospital Blood Group Units Inventory</h3>
                            <div class="bc-page-sub">Detailed breakdown of available blood groups and unit quantities per hospital.</div>
                        </div>
                    </div>
                    <asp:GridView ID="gvHospitalStockBreakdown" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="HospitalName" HeaderText="HOSPITAL NAME" />
                            <asp:BoundField DataField="City" HeaderText="CITY" />
                            <asp:BoundField DataField="Phone" HeaderText="CONTACT" />
                            <asp:TemplateField HeaderText="AVAILABLE BLOOD GROUP UNITS">
                                <ItemTemplate>
                                    <%# FormatBloodGroupStock(Eval("AvailableBloodGroups").ToString(), Eval("UnitsAvailable")) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UnitsAvailable" HeaderText="TOTAL UNITS" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding:15px; text-align:center; color:#64748B;">No hospital stock records available.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>

                <div class="bc-card">
                    <div class="bc-page-head" style="margin-bottom:14px;">
                        <h3 style="margin:0;">Recent Blood Requests</h3>
                        <button type="button" class="bc-btn-outline bc-btn bc-btn-sm" data-goto="requests">View All</button>
                    </div>
                    <asp:GridView ID="gvDashRequests" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="PatientName" HeaderText="PATIENT NAME" />
                            <asp:BoundField DataField="BloodGroup" HeaderText="BLOOD GROUP" />
                            <asp:BoundField DataField="Hospital" HeaderText="HOSPITAL" />
                            <asp:BoundField DataField="City" HeaderText="CITY" />
                            <asp:BoundField DataField="EmergencyLevel" HeaderText="EMERGENCY LEVEL" />
                            <asp:BoundField DataField="HospitalContact" HeaderText="CONTACT" />
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding:15px; text-align:center; color:#64748B;">No recent requests found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <!-- DONORS -->
            <div class="bc-page-section" id="page-donors">
                <div class="bc-page-head">
                    <div>
                        <h1 class="bc-page-title">Manage Donors</h1>
                        <div class="bc-page-sub">View, verify and manage registered blood donors.</div>
                    </div>
                    <button type="button" class="bc-btn" onclick="togglePanel('addDonorPanel');">+ Add Donor</button>
                </div>

                <div class="bc-card" id="addDonorPanel" style="display:none;">
                    <h3 style="margin-top:0;">Add Donor</h3>
                    <div class="bc-form-row">
                        <div class="bc-field"><label class="bc-label">Full Name</label><asp:TextBox ID="txtDonorName" runat="server" CssClass="bc-input" /></div>
                        <div class="bc-field"><label class="bc-label">Blood Group</label>
                            <asp:DropDownList ID="ddlDonorBloodGroup" runat="server" CssClass="bc-select">
                                <asp:ListItem>A+</asp:ListItem><asp:ListItem>A-</asp:ListItem>
                                <asp:ListItem>B+</asp:ListItem><asp:ListItem>B-</asp:ListItem>
                                <asp:ListItem>AB+</asp:ListItem><asp:ListItem>AB-</asp:ListItem>
                                <asp:ListItem>O+</asp:ListItem><asp:ListItem>O-</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="bc-field"><label class="bc-label">City</label><asp:TextBox ID="txtDonorCity" runat="server" CssClass="bc-input" /></div>
                        <div class="bc-field"><label class="bc-label">Contact Number</label><asp:TextBox ID="txtDonorPhone" runat="server" CssClass="bc-input" /></div>
                        <div class="bc-field"><label class="bc-label">Email</label><asp:TextBox ID="txtDonorEmail" runat="server" CssClass="bc-input" /></div>
                    </div>
                    <asp:Button ID="btnSaveDonor" runat="server" Text="Save Donor" CssClass="bc-btn" OnClick="btnSaveDonor_Click" />
                    <button type="button" class="bc-btn bc-btn-ghost" onclick="togglePanel('addDonorPanel');">Cancel</button>
                </div>

                <div class="bc-card">
                    <div class="bc-form-row" style="margin-bottom:16px;">
                        <asp:TextBox ID="txtSearchDonor" runat="server" CssClass="bc-input" Placeholder="Search by name..." />
                        <asp:DropDownList ID="ddlFilterBloodGroup" runat="server" CssClass="bc-select">
                            <asp:ListItem Value="">All Blood Groups</asp:ListItem>
                            <asp:ListItem>A+</asp:ListItem><asp:ListItem>A-</asp:ListItem>
                            <asp:ListItem>B+</asp:ListItem><asp:ListItem>B-</asp:ListItem>
                            <asp:ListItem>AB+</asp:ListItem><asp:ListItem>AB-</asp:ListItem>
                            <asp:ListItem>O+</asp:ListItem><asp:ListItem>O-</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="btnFilterDonors" runat="server" Text="Filter" CssClass="bc-btn bc-btn-outline" OnClick="btnFilterDonors_Click" />
                    </div>
                    <asp:GridView ID="gvDonors" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None" OnRowCommand="gvDonors_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="DonorId" HeaderText="ID" />
                            <asp:BoundField DataField="FullName" HeaderText="NAME" />
                            <asp:BoundField DataField="BloodGroup" HeaderText="BLOOD GROUP" />
                            <asp:BoundField DataField="City" HeaderText="CITY" />
                            <asp:BoundField DataField="Phone" HeaderText="CONTACT" />
                            <asp:BoundField DataField="LastDonationDate" HeaderText="LAST DONATION" />
                            <asp:TemplateField HeaderText="STATUS">
                                <ItemTemplate>
                                    <span class='<%# Eval("Status").ToString() == "Eligible" ? "bc-badge bc-badge-available" : "bc-badge bc-badge-limited" %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ACTIONS">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnRemoveDonor" runat="server" CommandName="RemoveDonor" CommandArgument='<%# Eval("DonorId") %>' CssClass="bc-btn bc-btn-sm" Style="background:#7A1224;">Remove</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding:15px; text-align:center; color:#64748B;">No donors found.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <!-- HOSPITALS -->
            <div class="bc-page-section" id="page-hospitals">
                <div class="bc-page-head">
                    <div>
                        <h1 class="bc-page-title">Manage Hospitals</h1>
                        <div class="bc-page-sub">Verified hospitals and blood banks on the network.</div>
                    </div>
                    <button type="button" class="bc-btn" onclick="togglePanel('addHospitalPanel');">+ Add Hospital</button>
                </div>

                <div class="bc-card" id="addHospitalPanel" style="display:none;">
                    <h3 style="margin-top:0;">Add Hospital</h3>
                    <div class="bc-form-row">
                        <div class="bc-field"><label class="bc-label">Hospital Name</label><asp:TextBox ID="txtHospitalName" runat="server" CssClass="bc-input" /></div>
                        <div class="bc-field"><label class="bc-label">City</label><asp:TextBox ID="txtHospitalCity" runat="server" CssClass="bc-input" /></div>
                        <div class="bc-field"><label class="bc-label">Contact Number</label><asp:TextBox ID="txtHospitalPhone" runat="server" CssClass="bc-input" /></div>
                        <div class="bc-field"><label class="bc-label">Address</label><asp:TextBox ID="txtHospitalAddress" runat="server" CssClass="bc-input" /></div>
                        <div class="bc-field"><label class="bc-label">Available Blood Groups</label><asp:TextBox ID="txtHospitalBloodGroups" runat="server" CssClass="bc-input" Placeholder="e.g. O+, A+, B+" /></div>
                        <div class="bc-field">
                            <label class="bc-label">Badge Type</label>
                            <asp:DropDownList ID="ddlBadgeType" runat="server" CssClass="bc-select">
                                <asp:ListItem Value="Verified">Verified</asp:ListItem>
                                <asp:ListItem Value="Trusted">Trusted</asp:ListItem>
                                <asp:ListItem Value="Recommended">Recommended</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="bc-field"><label class="bc-label">Units Available</label><asp:TextBox ID="txtHospitalUnits" runat="server" CssClass="bc-input" Text="0" /></div>
                        <div class="bc-field">
                            <label class="bc-label">Hospital Image</label>
                            <asp:FileUpload ID="fuHospitalImage" runat="server" CssClass="bc-input" />
                        </div>
                    </div>
                    <asp:Button ID="btnSaveHospital" runat="server" Text="Save Hospital" CssClass="bc-btn" OnClick="btnSaveHospital_Click" />
                    <button type="button" class="bc-btn bc-btn-ghost" onclick="togglePanel('addHospitalPanel');">Cancel</button>
                </div>

                <div class="bc-card">
                    <asp:GridView ID="gvHospitals" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None" OnRowCommand="gvHospitals_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="HospitalId" HeaderText="ID" />
                            <asp:TemplateField HeaderText="IMAGE">
                                <ItemTemplate>
                                    <img src='<%# Eval("ImageUrl") %>' alt="Hospital" style="width:48px; height:48px; object-fit:cover; border-radius:8px; border:1px solid var(--bc-border);" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="HospitalName" HeaderText="HOSPITAL" />
                            <asp:BoundField DataField="City" HeaderText="CITY" />
                            <asp:BoundField DataField="Phone" HeaderText="CONTACT" />
                            <asp:BoundField DataField="UnitsAvailable" HeaderText="UNITS" />
                            <asp:TemplateField HeaderText="ACTIONS">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnRemoveHospital" runat="server" CommandName="RemoveHospital" CommandArgument='<%# Eval("HospitalId") %>' CssClass="bc-btn bc-btn-sm" Style="background:#7A1224;">Remove</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding:15px; text-align:center; color:#64748B;">No hospitals registered.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <!-- REQUESTS -->
            <div class="bc-page-section" id="page-requests">
                <div class="bc-page-head">
                    <div>
                        <h1 class="bc-page-title">Blood Requests</h1>
                        <div class="bc-page-sub">View and manages incoming blood requests from patients.</div>
                    </div>
                </div>
                <div class="bc-card">
                    <asp:GridView ID="gvAllRequests" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None" OnRowCommand="gvAllRequests_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" />
                            <asp:BoundField DataField="PatientName" HeaderText="PATIENT NAME" />
                            <asp:BoundField DataField="BloodGroup" HeaderText="BLOOD GROUP" />
                            <asp:BoundField DataField="Hospital" HeaderText="HOSPITAL" />
                            <asp:BoundField DataField="City" HeaderText="CITY" />
                            <asp:BoundField DataField="UnitsRequired" HeaderText="UNITS" />
                            <asp:BoundField DataField="EmergencyLevel" HeaderText="EMERGENCY LEVEL" />
                            <asp:BoundField DataField="HospitalContact" HeaderText="CONTACT" />
                            <asp:BoundField DataField="Reason" HeaderText="REASON" />
                            <asp:BoundField DataField="RequestDate" HeaderText="DATE" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:TemplateField HeaderText="ACTIONS">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDeleteReq" runat="server" CommandName="DeleteRequest" CommandArgument='<%# Eval("Id") %>' CssClass="bc-btn bc-btn-sm" Style="background:#7A1224;">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding:15px; text-align:center; color:#64748B;">No blood requests recorded.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <!-- USERS -->
            <div class="bc-page-section" id="page-users">
                <div class="bc-page-head">
                    <div>
                        <h1 class="bc-page-title">Manage Users</h1>
                        <div class="bc-page-sub">All registered accounts across donor and user roles.</div>
                    </div>
                </div>
                <div class="bc-card">
                    <asp:GridView ID="gvUsers" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None" OnRowCommand="gvUsers_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="UserId" HeaderText="ID" />
                            <asp:BoundField DataField="FullName" HeaderText="NAME" />
                            <asp:BoundField DataField="Email" HeaderText="EMAIL" />
                            <asp:BoundField DataField="Role" HeaderText="ROLE" />
                            <asp:TemplateField HeaderText="STATUS">
                                <ItemTemplate>
                                    <span class='<%# Eval("Status").ToString() == "Active" ? "bc-badge bc-badge-available" : "bc-badge bc-badge-pending" %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ACTIONS">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnToggleStatus" runat="server" CommandName="ToggleUserStatus" CommandArgument='<%# Eval("UserId") %>' CssClass="bc-btn bc-btn-sm bc-btn-outline">Toggle Status</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding:15px; text-align:center; color:#64748B;">No users registered.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <!-- SETTINGS -->
            <div class="bc-page-section" id="page-settings">
                <div class="bc-page-head">
                    <div>
                        <h1 class="bc-page-title">Settings</h1>
                        <div class="bc-page-sub">Admin account preferences.</div>
                    </div>
                </div>
                <div class="bc-card" style="max-width:520px;">
                    <div class="bc-field">
                        <label class="bc-label">Admin Name</label>
                        <asp:TextBox ID="txtAdminName" runat="server" CssClass="bc-input" Text="Admin User" />
                    </div>
                    <div class="bc-field">
                        <label class="bc-label">Email</label>
                        <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="bc-input" Text="admin@gmail.com" ReadOnly="true" />
                    </div>
                    <div class="bc-field">
                        <label class="bc-label">New Password</label>
                        <asp:TextBox ID="txtAdminPassword" runat="server" CssClass="bc-input" TextMode="Password" Placeholder="Leave blank to keep current password" />
                    </div>
                    <asp:Button ID="btnSaveSettings" runat="server" Text="Save Changes" CssClass="bc-btn" OnClick="btnSaveSettings_Click" />
                    <asp:Label ID="lblSettingsMsg" runat="server" Style="margin-left:12px; color:#15803D; font-weight:600;" Visible="false">Settings updated successfully.</asp:Label>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var masterHeader = document.querySelector('header');
            if (masterHeader) masterHeader.style.display = 'none';

            var masterFooter = document.querySelector('footer');
            if (masterFooter) masterFooter.style.display = 'none';

            var links = document.querySelectorAll('.bc-nav-link');
            var gotos = document.querySelectorAll('[data-goto]');

            function showPage(name) {
                document.querySelectorAll('.bc-page-section').forEach(function (s) { s.classList.remove('active'); });
                var targetPage = document.getElementById('page-' + name);
                if (targetPage) {
                    targetPage.classList.add('active');
                }
                links.forEach(function (l) { l.classList.toggle('active', l.getAttribute('data-page') === name); });
                window.scrollTo(0, 0);
            }

            links.forEach(function (l) {
                l.addEventListener('click', function () { showPage(l.getAttribute('data-page')); });
            });
            gotos.forEach(function (g) {
                g.addEventListener('click', function () { showPage(g.getAttribute('data-goto')); });
            });
        });

        function togglePanel(id) {
            var p = document.getElementById(id);
            if (p) {
                p.style.display = (p.style.display === 'none' || p.style.display === '') ? 'block' : 'none';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder2">
                
</asp:Content>