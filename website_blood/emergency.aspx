<%@ Page Title="Emergency Blood Search - BloodConnect" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="emergency.aspx.cs" Inherits="website_blood.emergency" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Meta and Fonts -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Emergency Blood Search - Locate hospitals and blood units instantly on BloodConnect." />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.4/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
    <style>
        .blood-btn.active {
            background-color: #dc3545 !important;
            color: #fff !important;
            border-color: #dc3545 !important;
        }

        /* Professional Sticky Emergency Banner with High-Contrast Text */
        .sticky-emergency-banner {
            position: sticky;
            top: 76px; /* Sits directly beneath main navbar */
            z-index: 1020;
            background: linear-gradient(135deg, #b91c1c 0%, #dc2626 50%, #991b1b 100%);
            box-shadow: 0 4px 20px rgba(185, 28, 28, 0.3);
            backdrop-filter: blur(8px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .sticky-emergency-banner h2, 
        .sticky-emergency-banner p, 
        .sticky-emergency-banner i {
            color: #ffffff !important;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.4);
        }

        .banner-subtext {
            color: rgba(255, 255, 255, 0.92) !important;
            font-weight: 400;
        }

        .pulse-dot {
            width: 10px;
            height: 10px;
            background-color: #22c55e;
            border-radius: 50%;
            display: inline-block;
            box-shadow: 0 0 0 rgba(34, 197, 94, 0.7);
            animation: pulse 1.8s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(0.95);
                box-shadow: 0 0 0 0 rgba(34, 197, 94, 0.8);
            }
            70% {
                transform: scale(1);
                box-shadow: 0 0 0 8px rgba(34, 197, 94, 0);
            }
            100% {
                transform: scale(0.95);
                box-shadow: 0 0 0 0 rgba(34, 197, 94, 0);
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <!-- Page Loader -->
    <div id="pageLoader" class="page-loader d-flex align-items-center justify-content-center">
        <div class="spinner-border text-white" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>

    <!-- Noscript Notice -->
    <noscript>
        <div style="position:fixed;inset:0;display:flex;align-items:center;justify-content:center;background:rgba(0,0,0,0.6);z-index:1060;padding:20px;">
            <div style="background:white;border-radius:12px;padding:20px;max-width:520px;width:100%;text-align:center;">
                <h5 style="color:#D32F2F;margin-bottom:12px;">JavaScript is disabled</h5>
                <p style="color:#6c7280;margin-bottom:12px;">Use the links below to open pages directly.</p>
                <div style="display:flex;flex-wrap:wrap;gap:8px;justify-content:center;">
                    <a href="search-blood.aspx" style="padding:8px 12px;background:#D32F2F;color:#fff;border-radius:6px;">Search Blood</a>
                    <a href="hospitals.aspx" style="padding:8px 12px;background:#1565C0;color:#fff;border-radius:6px;">Hospitals</a>
                    <a href="become-donor.aspx" style="padding:8px 12px;background:#6c757d;color:#fff;border-radius:6px;">Donor</a>
                    <a href="request-blood.aspx" style="padding:8px 12px;background:#f59e0b;color:#111;border-radius:6px;">Request</a>
                </div>
            </div>
        </div>
    </noscript>

    <!-- HEADER SECTION -->
    <header class="sticky-top shadow-sm bg-white">
        <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
            <div class="container">
                <asp:HyperLink ID="lnkBrand" runat="server" NavigateUrl="~/index.aspx" CssClass="navbar-brand fw-bold text-danger">BloodConnect</asp:HyperLink>
                
                <asp:LinkButton ID="btnNavbarToggler" runat="server" CssClass="navbar-toggler" OnClientClick="return false;" data-bs-toggle="collapse" data-bs-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </asp:LinkButton>
                
                <div class="collapse navbar-collapse" id="mainNavbar">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-lg-center">
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="~/index.aspx" CssClass="nav-link">Home</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkSearchBlood" runat="server" NavigateUrl="~/search-blood.aspx" CssClass="nav-link">Search Blood</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkHospitals" runat="server" NavigateUrl="~/hospitals.aspx" CssClass="nav-link">Hospitals</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkBecomeDonor" runat="server" NavigateUrl="~/become-donor.aspx" CssClass="nav-link">Become Donor</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkRequestBlood" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="nav-link">Request Blood</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkEmergency" runat="server" NavigateUrl="~/emergency.aspx" CssClass="nav-link active">Emergency</asp:HyperLink>
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

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- MAIN EMERGENCY CONTENT -->
    <main class="bg-light pb-5">
        <!-- Sticky Professional Emergency Banner -->
        <section class="sticky-emergency-banner text-white py-3 mb-4">
            <div class="container">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-center gap-2">
                    <div class="d-flex align-items-center gap-2">
                        <span class="pulse-dot"></span>
                        <span class="badge bg-white text-danger fw-bold text-uppercase px-2.5 py-1" style="font-size: 0.78rem; letter-spacing: 0.5px;">Priority Desk 24/7</span>
                        <h2 class="h5 fw-bold mb-0 text-white ms-2"><i class="bi bi-lightning-charge-fill me-1"></i>Emergency Blood Network</h2>
                    </div>
                    <p class="small banner-subtext mb-0 d-none d-lg-block">Real-time hospital inventory sync for critical dispatch and emergency response.</p>
                </div>
            </div>
        </section>

        <section class="container">
            <div class="row g-4 align-items-start">
                <!-- Search Panel -->
                <div class="col-lg-5">
                    <div class="card rounded-4 shadow-sm border-0 p-4 bg-white">
                        <div class="d-flex align-items-center mb-3">
                            <div class="badge bg-danger text-white p-2 me-3"><i class="bi bi-lightning-fill fs-5"></i></div>
                            <div>
                                <h4 class="fw-bold mb-0">Quick Search</h4>
                                <small class="text-muted">Available 24/7 Priority Desk</small>
                            </div>
                        </div>

                        <div class="row g-3 mt-2">
                            <div class="col-12">
                                <label class="form-label fw-semibold">Select City</label>
                                <asp:DropDownList ID="ddlEmergencyCity" runat="server" CssClass="form-select form-select-lg">
                                    <asp:ListItem Value="" Selected="True">Choose City...</asp:ListItem>
                                    <asp:ListItem Value="Rajkot">Rajkot</asp:ListItem>
                                    <asp:ListItem Value="Ahmedabad">Ahmedabad</asp:ListItem>
                                    <asp:ListItem Value="Surat">Surat</asp:ListItem>
                                    <asp:ListItem Value="Vadodara">Vadodara</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12">
                                <label class="form-label fw-semibold">Blood Group Needed</label>
                                <div class="row g-2" id="bloodGroupSelection">
                                    <div class="col-3"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="A+">A+</button></div>
                                    <div class="col-3"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="A-">A-</button></div>
                                    <div class="col-3"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="B+">B+</button></div>
                                    <div class="col-3"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="B-">B-</button></div>
                                    <div class="col-3"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="O+">O+</button></div>
                                    <div class="col-3"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="O-">O-</button></div>
                                    <div class="col-3"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="AB+">AB+</button></div>
                                    <div class="col-3"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="AB-">AB-</button></div>
                                </div>
                                <asp:HiddenField ID="hfSelectedBlood" runat="server" />
                            </div>

                            <div class="col-12 d-grid mt-4">
                                <asp:Button ID="btnEmergencySearch" runat="server" Text="Search Immediately" CssClass="btn btn-danger btn-lg fw-semibold" OnClick="btnEmergencySearch_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Emergency Search Results -->
                <div class="col-lg-7">
                    <div class="card rounded-4 shadow-sm border-0 p-4 bg-white">
                        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-3">
                            <h5 class="fw-bold mb-0">Emergency Results</h5>
                            <asp:Label ID="lblResultCount" runat="server" CssClass="badge bg-danger bg-opacity-10 text-danger" Text="0 Available Centers"></asp:Label>
                        </div>

                        <div class="row g-3" id="resultsContainer">
                            <asp:Repeater ID="rptrEmergencyResults" runat="server">
                                <ItemTemplate>
                                    <div class="col-12 hospital-item">
                                        <div class="border rounded-3 p-3 d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                                            <div>
                                                <div class="d-flex align-items-center gap-2">
                                                    <h6 class="fw-bold mb-0"><%# Eval("HospitalName") %></h6>
                                                    <span class="badge bg-success"><%# Eval("BadgeType") %></span>
                                                </div>
                                                <p class="small text-muted mb-1"><i class="bi bi-geo-alt-fill text-danger me-1"></i><%# Eval("Address") %>, <%# Eval("City") %></p>
                                                <p class="small mb-0 text-danger fw-semibold"><i class="bi bi-droplet-fill me-1"></i>Available: <%# Eval("AvailableBloodGroups") %> (<%# Eval("UnitsAvailable") %> Units)</p>
                                            </div>
                                            <div class="d-flex gap-2">
                                                <a href='<%# "request-blood.aspx?hospital=" + Server.UrlEncode(Eval("HospitalName").ToString()) %>' class="btn btn-sm btn-danger">Request</a>
                                                <a href='<%# "tel:" + Eval("Phone") %>' class="btn btn-sm btn-outline-secondary"><i class="bi bi-telephone-fill"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <!-- FOOTER -->
    <footer class="footer bg-white py-5 border-top">
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-4">
                    <h5 class="text-danger fw-bold">BloodConnect</h5>
                    <p class="text-muted">A reliable portal for emergency blood availability, hospital coordination, and donor support with a modern, accessible experience.</p>
                    <div class="d-flex gap-3">
                        <a class="text-muted fs-5" href="#"><i class="bi bi-facebook"></i></a>
                        <a class="text-muted fs-5" href="#"><i class="bi bi-twitter"></i></a>
                        <a class="text-muted fs-5" href="#"><i class="bi bi-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <h6>Quick Links</h6>
                    <ul class="list-unstyled">
                        <li><asp:HyperLink ID="lnkFooterHome" runat="server" CssClass="footer-link" NavigateUrl="~/index.aspx">Home</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterHospitals" runat="server" CssClass="footer-link" NavigateUrl="~/hospitals.aspx">Hospitals</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterAbout" runat="server" CssClass="footer-link" NavigateUrl="~/about.aspx">About</asp:HyperLink></li>
                        <li><asp:HyperLink ID="lnkFooterContact" runat="server" CssClass="footer-link" NavigateUrl="~/contact.aspx">Contact</asp:HyperLink></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h6>Emergency Contacts</h6>
                    <p class="mb-1"><i class="bi bi-telephone-fill me-2 text-danger"></i>National Helpline: 112</p>
                    <p class="mb-1"><i class="bi bi-envelope-fill me-2 text-danger"></i>support@bloodconnect.org</p>
                    <p class="mb-0"><i class="bi bi-geo-alt-fill me-2 text-danger"></i>Gujarat, India</p>
                </div>
                <div class="col-lg-3">
                    <h6>Need Assistance</h6>
                    <p class="mb-1 text-muted">Contact our help desk for hospital coordination and donor scheduling.</p>
                    <p class="mb-0 fw-semibold text-danger">Help Desk: +91 99887 66554</p>
                </div>
            </div>
            <div class="text-center mt-4 text-muted small">&copy; 2026 BloodConnect. All rights reserved.</div>
        </div>
    </footer>

    <button id="scrollTopBtn" class="btn btn-danger rounded-circle shadow-lg" type="button">
        <i class="bi bi-arrow-up"></i>
    </button>

    <!-- Hidden Server Logout Button -->
    <asp:Button ID="btnLogoutHidden" runat="server" OnClick="btnLogout_Click" Style="display:none;" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // 1. Session Auth handling
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

            // 2. Blood group selection handling
            const bloodBtns = document.querySelectorAll(".blood-btn");
            const hiddenField = document.getElementById("<%= hfSelectedBlood.ClientID %>");

            bloodBtns.forEach(btn => {
                if (hiddenField.value && btn.getAttribute("data-blood") === hiddenField.value) {
                    btn.classList.add("active");
                }

                btn.addEventListener("click", function() {
                    bloodBtns.forEach(b => b.classList.remove("active"));
                    this.classList.add("active");
                    hiddenField.value = this.getAttribute("data-blood");
                });
            });
        });

        function triggerLogout() {
            document.getElementById('<%= btnLogoutHidden.ClientID %>').click();
        }
    </script>
</asp:Content>