<%@ Page Title="Hospitals - BloodConnect" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="hospitals.aspx.cs" Inherits="website_blood.hospitals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="BloodConnect healthcare portal for hospital blood availability." />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.4/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />

    <style>
        body {
            background-color: #F8FAFC;
            font-family: 'Plus Jakarta Sans', sans-serif;
            color: #1E293B;
        }

        /* Perfectly Rounded Symmetrical Reference Card */
        .hospital-card {
            border: 1px solid #E2E8F0;
            border-radius: 20px !important;
            background: #FFFFFF;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.04);
            overflow: hidden !important;
            max-width: 340px;
            margin: 0 auto;
            position: relative;
        }

        .hospital-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 24px rgba(15, 23, 42, 0.08);
        }

        /* Fixed Image Frame - Shows Full Hospital Frontage */
        .hospital-card-img-wrapper {
            width: 100%;
            height: 180px;
            overflow: hidden;
            background-color: #0F172A;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        .hospital-card-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            object-position: center 30%;
            display: block;
        }

        .hospital-card-body {
            padding: 20px 22px;
        }

        /* Status Badges */
        .badge-verified {
            background-color: #FDE8E8 !important;
            color: #E11D48 !important;
            font-weight: 700;
            font-size: 12px;
            padding: 5px 12px;
            border-radius: 8px;
        }

        .badge-trusted {
            background-color: #E0EFFE !important;
            color: #2563EB !important;
            font-weight: 700;
            font-size: 12px;
            padding: 5px 12px;
            border-radius: 8px;
        }

        .badge-recommended {
            background-color: #DCFCE7 !important;
            color: #16A34A !important;
            font-weight: 700;
            font-size: 12px;
            padding: 5px 12px;
            border-radius: 8px;
        }

        /* City Label Top Right */
        .city-label {
            color: #64748B;
            font-weight: 500;
            font-size: 14px;
        }

        /* Typography */
        .hospital-title {
            font-size: 19px;
            font-weight: 700;
            color: #0F172A;
            margin-bottom: 2px;
            letter-spacing: -0.3px;
            line-height: 1.3;
        }

        .hospital-address {
            color: #64748B;
            font-size: 13.5px;
            margin-bottom: 14px;
            font-weight: 400;
        }

        /* Phone Row */
        .hospital-phone {
            font-size: 16px;
            font-weight: 700;
            color: #0F172A;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .hospital-phone i {
            color: #0F172A;
            font-size: 16px;
            transform: scaleX(-1);
        }

        /* Compact Blood Group Pills */
        .blood-pill {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-weight: 800;
            font-size: 12.5px;
            padding: 4px 10px;
            border-radius: 8px;
            margin-right: 6px;
            margin-bottom: 6px;
            min-width: 32px;
        }

        .blood-pill-red { background-color: #FDE8E8; color: #E11D48; }
        .blood-pill-blue { background-color: #DBEAFE; color: #2563EB; }
        .blood-pill-green { background-color: #DCFCE7; color: #16A34A; }

        /* Buttons */
        .btn-view-details {
            border: 1.5px solid #E11D48;
            color: #E11D48;
            background: #FFFFFF;
            font-weight: 600;
            font-size: 13px;
            padding: 7px 16px;
            border-radius: 8px;
            transition: all 0.2s ease;
        }

        .btn-view-details:hover {
            background: #FDE8E8;
            color: #BE123C;
            border-color: #BE123C;
        }

        .btn-map-action {
            background: #E11D48;
            color: #FFFFFF;
            font-weight: 600;
            font-size: 13px;
            padding: 7px 18px;
            border-radius: 8px;
            border: none;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-map-action:hover {
            background: #BE123C;
            color: #FFFFFF;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!-- HEADER SECTION -->
    <header class="sticky-top shadow-sm bg-white">
        <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
            <div class="container">
                <asp:HyperLink ID="lnkBrand" runat="server" NavigateUrl="~/index.aspx" CssClass="navbar-brand fw-bold text-danger fs-4">BloodConnect</asp:HyperLink>
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-lg-center">
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/index.aspx" CssClass="nav-link">Home</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkSearchBlood" runat="server" NavigateUrl="~/search-blood.aspx" CssClass="nav-link">Search Blood</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkHospitals" runat="server" NavigateUrl="~/hospitals.aspx" CssClass="nav-link active fw-bold text-danger">Hospitals</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkBecomeDonor" runat="server" NavigateUrl="~/become-donor.aspx" CssClass="nav-link">Become Donor</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkRequestBlood" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="nav-link">Request Blood</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkEmergency" runat="server" NavigateUrl="~/emergency.aspx" CssClass="nav-link">Emergency</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/about.aspx" CssClass="nav-link">About</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkContact" runat="server" NavigateUrl="~/contact.aspx" CssClass="nav-link">Contact</asp:HyperLink>
                        </li>

                        <!-- LOGIN / REGISTER (Default Guest) -->
                        <li class="nav-item nav-auth-guest">
                            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/login.aspx" CssClass="btn btn-outline-danger btn-sm ms-lg-3">Login</asp:HyperLink>
                        </li>
                        <li class="nav-item nav-auth-guest">
                            <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/register.aspx" CssClass="btn btn-danger btn-sm ms-2">Register</asp:HyperLink>
                        </li>

                        <!-- MY PROFILE / LOGOUT (Logged In User) -->
                        <li class="nav-item nav-auth-user d-none">
                            <asp:HyperLink ID="lnkProfile" runat="server" NavigateUrl="~/userpanel.aspx" CssClass="nav-link text-danger fw-bold ms-lg-2">My Profile</asp:HyperLink>
                        </li>
                        <li class="nav-item nav-auth-user d-none">
                            <a href="javascript:void(0);" onclick="triggerLogout();" class="btn btn-outline-danger btn-sm ms-2">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- MAIN HOSPITALS CONTENT -->
    <main class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <span class="badge bg-danger bg-opacity-10 text-danger px-3 py-2 rounded-pill">Hospital Directory</span>
                <h1 class="fw-bold mt-3 text-dark">Trusted Hospital Partners</h1>
                <p class="text-muted">Search hospitals, review contact details, and see available blood groups at a glance.</p>
            </div>

            <div class="row g-4">
                <asp:Repeater ID="rptrHospitals" runat="server">
                    <ItemTemplate>
                        <!-- Perfectly Formatted Reference Card -->
                        <div class="col-md-6 col-lg-4 d-flex justify-content-center">
                            <div class="hospital-card w-100 h-100">
                                <div class="hospital-card-img-wrapper">
                                    <img src='<%# ResolveUrl(Eval("ImageUrl").ToString()) %>' class="hospital-card-img" alt='<%# Eval("HospitalName") %>' onerror="this.src='https://images.unsplash.com/photo-1586773860418-d37222d8fce3?q=80&w=800&auto=format&fit=crop';" />
                                </div>
                                
                                <div class="hospital-card-body d-flex flex-column justify-content-between">
                                    <div>
                                        <!-- Header Row: Badge & City -->
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <span class='<%# Eval("BadgeType").ToString() == "Trusted" ? "badge-trusted" : (Eval("BadgeType").ToString() == "Recommended" ? "badge-recommended" : "badge-verified") %>'>
                                                <%# Eval("BadgeType") %>
                                            </span>
                                            <span class="city-label"><%# Eval("City") %></span>
                                        </div>

                                        <!-- Hospital Name & Address -->
                                        <h5 class="hospital-title"><%# Eval("HospitalName") %></h5>
                                        <div class="hospital-address"><%# Eval("Address") %></div>

                                        <!-- Phone -->
                                        <div class="hospital-phone">
                                            <i class="bi bi-telephone-fill"></i>
                                            <span><%# Eval("Phone") %></span>
                                        </div>

                                        <!-- Blood Group Pills -->
                                        <div class="mb-4">
                                            <%# GetBloodGroupPills(Eval("AvailableBloodGroups").ToString()) %>
                                        </div>
                                    </div>

                                    <!-- Actions -->
                                    <div class="d-flex gap-2">
                                        <button type="button" class="btn btn-view-details" data-bs-toggle="modal" data-bs-target='#hospitalModal<%# Eval("HospitalId") %>'>View Details</button>
                                        <a href='https://www.google.com/maps/search/?api=1&query=<%# Server.UrlEncode(Eval("HospitalName").ToString() + " " + Eval("City").ToString()) %>' target="_blank" class="btn btn-map-action">Map</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Details Modal -->
                        <div class="modal fade" id='hospitalModal<%# Eval("HospitalId") %>' tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content rounded-4 border-0 shadow-lg">
                                    <div class="modal-header">
                                        <h5 class="modal-title fw-bold"><%# Eval("HospitalName") %></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p class="text-muted mb-2"><i class="bi bi-geo-alt-fill text-danger me-2"></i><%# Eval("Address") %>, <%# Eval("City") %></p>
                                        <p class="mb-2"><strong>Available Blood Groups:</strong></p>
                                        <div class="mb-3">
                                            <%# GetBloodGroupPills(Eval("AvailableBloodGroups").ToString()) %>
                                        </div>
                                        <p class="mb-2"><strong>Total Units Available:</strong> <%# Eval("UnitsAvailable") %> Units</p>
                                        <p class="mb-0"><strong>Emergency Contact:</strong> <%# Eval("Phone") %></p>
                                    </div>
                                    <div class="modal-footer border-0">
                                        <a href="request-blood.aspx" class="btn btn-danger w-100 rounded-3 py-2 fw-semibold">Request Blood Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </main>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- FOOTER -->
    <footer class="footer bg-white py-5 border-top">
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-4">
                    <h5 class="text-danger fw-bold">BloodConnect</h5>
                    <p class="text-muted">A reliable portal for emergency blood availability, hospital coordination, and donor support with a modern, accessible experience.</p>
                </div>
                <div class="col-lg-2">
                    <h6>Quick Links</h6>
                    <ul class="list-unstyled">
                        <li><asp:HyperLink ID="lnkFooterHome" runat="server" NavigateUrl="~/index.aspx" CssClass="footer-link">Home</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterHospitals" runat="server" NavigateUrl="~/hospitals.aspx" CssClass="footer-link">Hospitals</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterAbout" runat="server" NavigateUrl="~/about.aspx" CssClass="footer-link">About</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterContact" runat="server" NavigateUrl="~/contact.aspx" CssClass="footer-link">Contact</asp:HyperLink></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h6>Emergency Contacts</h6>
                    <p class="mb-1"><i class="bi bi-telephone-fill me-2 text-danger"></i>National Helpline: 112</p>
                    <p class="mb-1"><i class="bi bi-envelope-fill me-2 text-danger"></i>support@bloodconnect.org</p>
                </div>
                <div class="col-lg-3">
                    <h6>Need Assistance</h6>
                    <p class="mb-1 text-muted">Contact our help desk for hospital coordination and donor scheduling.</p>
                    <p class="mb-0 fw-semibold text-danger">+91 99887 66554</p>
                </div>
            </div>
            <div class="text-center mt-4 text-muted small">&copy; 2026 BloodConnect. All rights reserved.</div>
        </div>
    </footer>

    <!-- Hidden Server Logout Button -->
    <asp:Button ID="btnLogoutHidden" runat="server" OnClick="btnLogout_Click" Style="display:none;" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Session Auth handling
            var isLoggedIn = '<%= Session["UserEmail"] != null ? "true" : "false" %>';
            var userEmail = '<%= Session["UserEmail"] != null ? Session["UserEmail"].ToString().ToLower() : "" %>';

            if (isLoggedIn === "true") {
                document.querySelectorAll('.nav-auth-guest').forEach(function (el) {
                    el.classList.add('d-none');
                });
                document.querySelectorAll('.nav-auth-user').forEach(function (el) {
                    el.classList.remove('d-none');
                });

                // ADMIN LINK PATCH: Route to Admin Panel when Admin is logged in
                if (userEmail === "admin@gmail.com") {
                    var profileLinks = document.querySelectorAll('a[href*="userpanel.aspx"]');
                    profileLinks.forEach(function (link) {
                        link.setAttribute('href', 'adminpanel.aspx');
                        link.innerHTML = '<i class="bi bi-shield-lock-fill me-1"></i> Admin Panel';
                    });
                }
            }
        });

        function triggerLogout() {
            document.getElementById('<%= btnLogoutHidden.ClientID %>').click();
        }
    </script>
</asp:Content>