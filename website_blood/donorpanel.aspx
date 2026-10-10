<%@ Page Title="Donor Panel - BloodConnect" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="donorpanel.aspx.cs" Inherits="website_blood.donorpanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            /* Refined Professional Palette */
            --bc-red: #D92D20;            /* Primary Vibrant Red */
            --bc-red-hover: #B52216;      /* Hover State Red */
            --bc-red-dark: #841910;       /* Dark Red Contrast */
            --bc-red-light: #FEE4E2;      /* Soft Light Red Accent */
            
            --bc-navy: #0F172A;           /* High-contrast Slate Dark Header/Text */
            --bc-text-body: #334155;      /* Slate Body Text */
            --bc-gray: #64748B;           /* Subdued Gray Text */
            --bc-bg: #F8FAFC;             /* Professional Dashboard Background */
            --bc-card-bg: #FFFFFF;        /* Card Surface */
            --bc-border: #E2E8F0;         /* Modern Border Color */
            --bc-border-hover: #CBD5E1;   /* Border Hover State */
            
            --bc-green: #15803D;          /* Refined Success Green */
            --bc-green-bg: #DCFCE7;
            --bc-amber: #B45309;          /* Refined Warning Amber */
            --bc-amber-bg: #FEF3C7;
            
            /* Elevation & Smooth Transitions */
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.07), 0 2px 4px -2px rgba(0, 0, 0, 0.05);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.08), 0 4px 6px -4px rgba(0, 0, 0, 0.04);
            --radius-md: 10px;
            --radius-lg: 16px;
            --transition: all 0.2s ease-in-out;
        }

        * { box-sizing: border-box; }
        body { margin: 0; font-family: 'Inter', 'Segoe UI', Arial, sans-serif; background: var(--bc-bg); color: var(--bc-text-body); }
        a { text-decoration: none; color: inherit; }

        /* Top Notification Alert Strip */
        .bc-alert-strip { 
            background: linear-gradient(90deg, #991B1B, #B91C1C); 
            color: #FFFFFF; 
            padding: 10px 32px; 
            font-size: 13.5px; 
            font-weight: 600; 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            flex-wrap: wrap; 
            gap: 12px; 
            box-shadow: var(--shadow-sm);
        }

        /* Modern Sticky Topbar */
        .bc-topbar { 
            background: var(--bc-card-bg); 
            border-bottom: 1px solid var(--bc-border); 
            display: flex; 
            align-items: center; 
            justify-content: space-between; 
            padding: 14px 36px; 
            position: sticky; 
            top: 0; 
            z-index: 50; 
            gap: 20px; 
            box-shadow: var(--shadow-sm);
        }
        .bc-topbar-left { display: flex; align-items: center; gap: 24px; }
        .bc-logo { font-size: 22px; font-weight: 800; color: var(--bc-red); letter-spacing: -0.5px; }
        .bc-topbar-right { display: flex; align-items: center; gap: 16px; }
        
        .bc-role-badge { 
            background: var(--bc-green-bg); 
            color: var(--bc-green); 
            font-size: 11.5px; 
            font-weight: 700; 
            padding: 5px 12px; 
            border-radius: 999px; 
            letter-spacing: 0.5px; 
        }
        
        .bc-user-chip { 
            display: flex; 
            align-items: center; 
            gap: 10px; 
            font-weight: 600; 
            font-size: 14px; 
            color: var(--bc-navy);
            background: #F1F5F9; 
            padding: 5px 14px 5px 6px; 
            border-radius: 999px; 
            border: 1px solid var(--bc-border); 
            transition: var(--transition);
        }
        .bc-user-chip:hover {
            border-color: var(--bc-border-hover);
            background: #E2E8F0;
        }
        .bc-avatar { 
            width: 32px; 
            height: 32px; 
            border-radius: 50%; 
            background: var(--bc-red); 
            color: #FFFFFF; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-weight: 700; 
            font-size: 13px; 
        }

        /* Shell & Sidebar */
        .bc-shell { display: flex; min-height: calc(100vh - 62px); }
        .bc-sidebar { 
            width: 250px; 
            background: var(--bc-card-bg); 
            border-right: 1px solid var(--bc-border); 
            padding: 24px 16px; 
            flex-shrink: 0; 
        }
        .bc-nav-section { 
            font-size: 11px; 
            text-transform: uppercase; 
            color: var(--bc-gray); 
            font-weight: 700; 
            margin: 20px 10px 8px; 
            letter-spacing: .08em; 
        }
        .bc-nav-link { 
            display: flex; 
            align-items: center; 
            gap: 12px; 
            padding: 10px 14px; 
            border-radius: var(--radius-md); 
            font-size: 14px; 
            font-weight: 600; 
            color: var(--bc-text-body); 
            margin-bottom: 6px; 
            cursor: pointer; 
            border: none; 
            background: transparent; 
            width: 100%; 
            text-align: left; 
            font-family: inherit; 
            transition: var(--transition); 
        }
        
        /* Interactive Sidebar Hover Effects */
        .bc-nav-link:hover { 
            background: var(--bc-red-light); 
            color: var(--bc-red); 
            transform: translateX(4px);
        }
        .bc-nav-link.active { 
            background: var(--bc-red); 
            color: #FFFFFF; 
            box-shadow: 0 4px 12px rgba(217, 45, 32, 0.25);
        }

        /* Main Content Workspace */
        .bc-main { flex: 1; padding: 32px 40px; }

        .bc-page-head { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 24px; flex-wrap: wrap; gap: 12px; }
        .bc-page-title { font-size: 26px; font-weight: 800; margin: 0; color: var(--bc-navy); letter-spacing: -0.5px; }
        .bc-page-sub { color: var(--bc-gray); font-size: 14px; margin-top: 4px; }

        /* Buttons & Hover States */
        .bc-btn { 
            display: inline-flex; 
            align-items: center; 
            justify-content: center; 
            gap: 8px; 
            border: 1px solid transparent; 
            border-radius: var(--radius-md); 
            padding: 10px 20px; 
            font-weight: 600; 
            font-size: 13.5px; 
            cursor: pointer; 
            background: var(--bc-red); 
            color: #FFFFFF; 
            transition: var(--transition); 
            text-decoration: none; 
            box-shadow: var(--shadow-sm);
        }
        .bc-btn:hover { 
            background: var(--bc-red-hover); 
            color: #FFFFFF; 
            transform: translateY(-1.5px);
            box-shadow: var(--shadow-md);
        }
        .bc-btn:active {
            transform: translateY(0);
        }
        .bc-btn-outline { 
            background: var(--bc-card-bg); 
            color: var(--bc-navy); 
            border: 1px solid var(--bc-border); 
        }
        .bc-btn-outline:hover { 
            background: var(--bc-bg); 
            border-color: var(--bc-border-hover); 
            color: var(--bc-red);
        }
        .bc-btn-sm { padding: 7px 14px; font-size: 12.5px; border-radius: 8px; }

        /* Cards & Elevations */
        .bc-card { 
            background: var(--bc-card-bg); 
            border: 1px solid var(--bc-border); 
            border-radius: var(--radius-lg); 
            padding: 26px; 
            box-shadow: var(--shadow-sm);
            transition: var(--transition);
        }
        .bc-card:hover {
            box-shadow: var(--shadow-md);
        }
        .bc-card + .bc-card { margin-top: 20px; }

        /* Dashboard Stat Grid & Hover Animations */
        .bc-stat-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(210px, 1fr)); gap: 18px; margin-bottom: 24px; }
        .bc-stat-card { 
            background: var(--bc-card-bg); 
            border: 1px solid var(--bc-border); 
            border-radius: var(--radius-lg); 
            padding: 20px 22px; 
            transition: var(--transition);
            box-shadow: var(--shadow-sm);
        }
        .bc-stat-card:hover {
            transform: translateY(-3px);
            border-color: var(--bc-border-hover);
            box-shadow: var(--shadow-lg);
        }
        .bc-stat-label { font-size: 13px; color: var(--bc-gray); font-weight: 600; }
        .bc-stat-value { font-size: 30px; font-weight: 800; margin-top: 6px; color: var(--bc-navy); letter-spacing: -0.5px; }
        .bc-stat-value.red { color: var(--bc-red); }

        /* Form Controls & Focus States */
        .bc-field { margin-bottom: 18px; }
        .bc-label { display: block; font-size: 13px; font-weight: 700; margin-bottom: 6px; color: var(--bc-navy); }
        .bc-input, .bc-select, textarea.bc-input { 
            width: 100%; 
            padding: 11px 14px; 
            border: 1px solid var(--bc-border); 
            border-radius: var(--radius-md); 
            font-size: 14px; 
            background: #FFFFFF; 
            color: var(--bc-navy); 
            font-family: inherit; 
            transition: var(--transition);
        }
        .bc-input:hover, .bc-select:hover {
            border-color: var(--bc-border-hover);
        }
        .bc-input:focus, .bc-select:focus { 
            outline: none; 
            border-color: var(--bc-red); 
            box-shadow: 0 0 0 3px rgba(217, 45, 32, 0.15);
        }
        .bc-form-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 18px; }

        /* Modern Tables with Row Hover Effects */
        .bc-table { width: 100%; border-collapse: collapse; font-size: 14px; }
        .bc-table th { 
            text-align: left; 
            font-size: 12px; 
            text-transform: uppercase; 
            letter-spacing: .05em; 
            color: var(--bc-gray); 
            padding: 12px 14px; 
            border-bottom: 1.5px solid var(--bc-border); 
            background: #F8FAFC;
        }
        .bc-table td { padding: 14px 14px; border-bottom: 1px solid var(--bc-border); vertical-align: middle; }
        .bc-table tr { transition: var(--transition); }
        .bc-table tbody tr:hover { background-color: #F1F5F9; }
        .bc-table tr:last-child td { border-bottom: none; }

        /* Badges */
        .bc-badge { display: inline-block; font-size: 12px; font-weight: 700; padding: 4px 10px; border-radius: 999px; }
        .bc-badge-available { background: var(--bc-green-bg); color: var(--bc-green); }
        .bc-badge-limited { background: var(--bc-amber-bg); color: var(--bc-amber); }
        .bc-badge-urgent { background: var(--bc-red-light); color: var(--bc-red-dark); }
        .bc-badge-pending { background: #E2E8F0; color: var(--bc-navy); }

        /* Hero Banner Gradient */
        .bc-hero { 
            background: linear-gradient(135deg, #7F1D1D 0%, #D92D20 60%, #4338CA 100%); 
            border-radius: var(--radius-lg); 
            padding: 36px; 
            color: #FFFFFF; 
            margin-bottom: 24px; 
            box-shadow: var(--shadow-md);
        }
        .bc-hero-tag { 
            display: inline-block; 
            background: rgba(255, 255, 255, 0.2); 
            backdrop-filter: blur(4px);
            padding: 4px 12px; 
            border-radius: 999px; 
            font-size: 12px; 
            font-weight: 700; 
            margin-bottom: 12px; 
        }
        .bc-hero h1 { font-size: 32px; margin: 0 0 10px; font-weight: 800; letter-spacing: -0.5px; }
        .bc-hero p { opacity: 0.95; max-width: 540px; margin: 0; line-height: 1.5; }

        .bc-page-section { display: none; }
        .bc-page-section.active { display: block; }

        @media (max-width: 900px) {
            .bc-sidebar { display: none; }
            .bc-main { padding: 20px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ALERT STRIP -->
    <div class="bc-alert-strip">
        <span>⚠️ Emergency Blood Support - 24/7 Active &nbsp; | &nbsp; National Helpline: 112</span>
        <a class="bc-btn bc-btn-sm" style="background:#FFFFFF; color:#991B1B;" data-goto="requests">View Nearby Requests</a>
    </div>

    <!-- TOPBAR -->
    <div class="bc-topbar">
        <div class="bc-topbar-left">
            <div class="bc-logo">BloodConnect</div>
            <!-- Back Button to User Panel -->
            <asp:LinkButton ID="btnBackToUserPanel" runat="server" CssClass="bc-btn bc-btn-outline bc-btn-sm" OnClick="btnBackToUserPanel_Click">
                ← Back to User Panel
            </asp:LinkButton>
        </div>

        <div class="bc-topbar-right">
            <span class="bc-role-badge">DONOR</span>
            <div class="bc-user-chip">
                <div class="bc-avatar"><asp:Literal ID="litAvatar" runat="server">D</asp:Literal></div>
                <span><asp:Literal ID="litTopName" runat="server">Donor Name</asp:Literal></span>
            </div>
            <asp:LinkButton ID="btnLogout" runat="server" CssClass="bc-btn bc-btn-outline bc-btn-sm" OnClick="btnLogout_Click">Logout</asp:LinkButton>
        </div>
    </div>

    <!-- MAIN SHELL -->
    <div class="bc-shell">
        <div class="bc-sidebar">
            <div class="bc-nav-section">Overview</div>
            <button type="button" class="bc-nav-link active" data-page="dashboard">Dashboard</button>

            <div class="bc-nav-section">Donations</div>
            <button type="button" class="bc-nav-link" data-page="history">Donation History</button>
            <button type="button" class="bc-nav-link" data-page="requests">Nearby Requests</button>

            <div class="bc-nav-section">Account</div>
            <button type="button" class="bc-nav-link" data-page="profile">Donor Profile</button>
        </div>

        <div class="bc-main">

            <!-- DASHBOARD TAB -->
            <div class="bc-page-section active" id="page-dashboard">
                <div class="bc-hero">
                    <span class="bc-hero-tag">Thank You for Saving Lives</span>
                    <h1>Welcome back, <asp:Literal ID="litWelcomeName" runat="server">Donor</asp:Literal></h1>
                    <p>Your donations help keep the emergency blood network running. Here's your current status.</p>
                </div>

                <div class="bc-stat-grid">
                    <div class="bc-stat-card">
                        <div class="bc-stat-label">Blood Group</div>
                        <div class="bc-stat-value red"><asp:Literal ID="litBloodGroup" runat="server">A+</asp:Literal></div>
                    </div>
                    <div class="bc-stat-card">
                        <div class="bc-stat-label">Total Donations</div>
                        <div class="bc-stat-value"><asp:Literal ID="litTotalDonations" runat="server">0</asp:Literal></div>
                    </div>
                    <div class="bc-stat-card">
                        <div class="bc-stat-label">Last Donation</div>
                        <div class="bc-stat-value" style="font-size:20px;"><asp:Literal ID="litLastDonation" runat="server">N/A</asp:Literal></div>
                    </div>
                    <div class="bc-stat-card">
                        <div class="bc-stat-label">Next Eligible Date</div>
                        <div class="bc-stat-value" style="font-size:20px;"><asp:Literal ID="litNextEligible" runat="server">Eligible Now</asp:Literal></div>
                    </div>
                </div>

                <div class="bc-card">
                    <div class="bc-page-head" style="margin-bottom:14px;">
                        <h3 style="margin:0;">Urgent Requests Near You</h3>
                        <a class="bc-btn bc-btn-outline bc-btn-sm" data-goto="requests">View All</a>
                    </div>
                    <asp:GridView ID="gvDashRequests" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Hospital" HeaderText="HOSPITAL" />
                            <asp:BoundField DataField="City" HeaderText="CITY" />
                            <asp:BoundField DataField="BloodGroup" HeaderText="BLOOD GROUP" />
                            <asp:TemplateField HeaderText="URGENCY">
                                <ItemTemplate>
                                    <span class='<%# Eval("EmergencyLevel").ToString() == "Urgent" || Eval("EmergencyLevel").ToString() == "Immediate" ? "bc-badge bc-badge-urgent" : "bc-badge bc-badge-limited" %>'>
                                        <%# Eval("EmergencyLevel") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ACTION">
                                <ItemTemplate>
                                    <a href='tel:<%# Eval("HospitalContact") %>' class="bc-btn bc-btn-sm">I Can Donate</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding: 15px; text-align: center; color: #64748B; font-weight: 500;">
                                No urgent requests available at the moment.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <!-- HISTORY TAB -->
            <div class="bc-page-section" id="page-history">
                <div class="bc-page-head">
                    <div>
                        <h1 class="bc-page-title">Donation History</h1>
                        <div class="bc-page-sub">A record of all your past blood donations.</div>
                    </div>
                </div>
                <div class="bc-card">
                    <asp:GridView ID="gvHistory" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="DonationDate" HeaderText="DATE" DataFormatString="{0:dd-MMM-yyyy}" />
                            <asp:BoundField DataField="Hospital" HeaderText="HOSPITAL" />
                            <asp:BoundField DataField="City" HeaderText="CITY" />
                            <asp:BoundField DataField="Units" HeaderText="UNITS DONATED" />
                            <asp:TemplateField HeaderText="STATUS">
                                <ItemTemplate>
                                    <span class="bc-badge bc-badge-available">Completed</span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding: 15px; text-align: center; color: #64748B; font-weight: 500;">
                                No donation history recorded yet.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <!-- REQUESTS TAB -->
            <div class="bc-page-section" id="page-requests">
                <div class="bc-page-head">
                    <div>
                        <h1 class="bc-page-title">Nearby Blood Requests</h1>
                        <div class="bc-page-sub">Requests near your city that match your blood group.</div>
                    </div>
                </div>
                <div class="bc-card">
                    <asp:GridView ID="gvAllRequests" runat="server" CssClass="bc-table" AutoGenerateColumns="False" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="Hospital" HeaderText="HOSPITAL" />
                            <asp:BoundField DataField="City" HeaderText="CITY" />
                            <asp:BoundField DataField="BloodGroup" HeaderText="BLOOD GROUP" />
                            <asp:BoundField DataField="UnitsRequired" HeaderText="UNITS NEEDED" />
                            <asp:TemplateField HeaderText="URGENCY">
                                <ItemTemplate>
                                    <span class='<%# Eval("EmergencyLevel").ToString() == "Urgent" || Eval("EmergencyLevel").ToString() == "Immediate" ? "bc-badge bc-badge-urgent" : "bc-badge bc-badge-limited" %>'>
                                        <%# Eval("EmergencyLevel") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ACTION">
                                <ItemTemplate>
                                    <a href='tel:<%# Eval("HospitalContact") %>' class="bc-btn bc-btn-sm">I Can Donate</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding: 15px; text-align: center; color: #64748B; font-weight: 500;">
                                No nearby blood requests matching your details.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>

            <!-- PROFILE TAB -->
            <div class="bc-page-section" id="page-profile">
                <div class="bc-page-head">
                    <div>
                        <h1 class="bc-page-title">Donor Profile</h1>
                        <div class="bc-page-sub">Keep your donor details up to date.</div>
                    </div>
                </div>
                <div class="bc-card" style="max-width:640px;">
                    <div class="bc-form-row">
                        <div class="bc-field">
                            <label class="bc-label">Full Name</label>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="bc-input"></asp:TextBox>
                        </div>
                        <div class="bc-field">
                            <label class="bc-label">Blood Group</label>
                            <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="bc-select">
                                <asp:ListItem>A+</asp:ListItem>
                                <asp:ListItem>A-</asp:ListItem>
                                <asp:ListItem>B+</asp:ListItem>
                                <asp:ListItem>B-</asp:ListItem>
                                <asp:ListItem>AB+</asp:ListItem>
                                <asp:ListItem>AB-</asp:ListItem>
                                <asp:ListItem>O+</asp:ListItem>
                                <asp:ListItem>O-</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="bc-field">
                            <label class="bc-label">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="bc-input" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="bc-field">
                            <label class="bc-label">Contact Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="bc-input"></asp:TextBox>
                        </div>
                        <div class="bc-field">
                            <label class="bc-label">City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="bc-input"></asp:TextBox>
                        </div>
                        <div class="bc-field">
                            <label class="bc-label">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="bc-input" TextMode="MultiLine" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                    <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="bc-btn" OnClick="btnSave_Click" />
                    <asp:Label ID="lblMsg" runat="server" Style="margin-left:12px;color:#15803D;font-weight:600;" Visible="false">Changes saved</asp:Label>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
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
    </script>
</asp:Content>