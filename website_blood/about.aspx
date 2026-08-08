<%@ Page Title="About Us - BloodConnect" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="website_blood.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Meta and Fonts -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="BloodConnect is a modern healthcare portal for hospital blood availability and donor management. Find blood fast and save lives." />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.4/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
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
                            <asp:HyperLink ID="lnkEmergency" runat="server" NavigateUrl="~/emergency.aspx" CssClass="nav-link">Emergency</asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/about.aspx" CssClass="nav-link active">About</asp:HyperLink>
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
    <!-- MAIN ABOUT CONTENT -->
    <main class="bg-light py-5">
        <!-- Hero Intro -->
        <section class="container py-5">
            <div class="row align-items-center gy-4">
                <div class="col-lg-6">
                    <span class="badge bg-danger bg-opacity-10 text-danger mb-3">About BloodConnect</span>
                    <h1 class="fw-bold">Government-inspired healthcare coordination with a modern interface.</h1>
                    <p class="lead text-muted">BloodConnect combines the structure of public healthcare networks with modern hospital portal usability to deliver fast blood availability and trusted donor management.</p>
                    <div class="d-flex gap-3 mt-4">
                        <span class="badge bg-danger bg-opacity-10 text-danger px-3 py-2"><i class="bi bi-check-circle-fill me-1"></i> Verified Hospitals</span>
                        <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-2"><i class="bi bi-check-circle-fill me-1"></i> 24/7 Support</span>
                        <span class="badge bg-success bg-opacity-10 text-success px-3 py-2"><i class="bi bi-check-circle-fill me-1"></i> 100% Free</span>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="card rounded-4 shadow-sm border-0 p-4 bg-white">
                        <h5 class="fw-bold">Our Promise</h5>
                        <p class="mb-0 text-muted">We help communities find lifesaving blood units through verified hospital partners, rapid requests, and donor-friendly registration. Every second counts in an emergency — we ensure you get the information you need instantly.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Mission, Vision, Objectives -->
        <section class="container py-5">
            <div class="row g-4">
                <div class="col-lg-4">
                    <div class="card rounded-4 shadow-sm border-0 h-100 p-4">
                        <div class="icon-box bg-danger-subtle text-danger mb-3"><i class="bi bi-shield-lock-fill"></i></div>
                        <h5>Mission</h5>
                        <p class="text-muted">Create a responsive emergency network for blood availability so families and hospitals can connect faster. We aim to bridge the gap between blood donors, hospitals, and patients in need through real-time data and seamless coordination.</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card rounded-4 shadow-sm border-0 h-100 p-4">
                        <div class="icon-box bg-primary-subtle text-primary mb-3"><i class="bi bi-eye-fill"></i></div>
                        <h5>Vision</h5>
                        <p class="text-muted">A future where urgent blood needs are matched intelligently with verified donors and hospital resources across the country. We envision an India where no life is lost due to the unavailability of blood during critical moments.</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card rounded-4 shadow-sm border-0 h-100 p-4">
                        <div class="icon-box bg-success-subtle text-success mb-3"><i class="bi bi-flag-fill"></i></div>
                        <h5>Objectives</h5>
                        <ul class="list-unstyled text-muted mb-0">
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-danger me-2"></i>Verified blood availability across 350+ hospitals</li>
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-danger me-2"></i>Trusted hospital directory with real-time stock</li>
                            <li class="mb-2"><i class="bi bi-check-circle-fill text-danger me-2"></i>Donor registration & management system</li>
                            <li><i class="bi bi-check-circle-fill text-danger me-2"></i>Emergency response coordination with instant alerts</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <section class="container py-3">
            <div class="row g-4 text-center">
                <div class="col-md-3">
                    <div class="stats-card rounded-4 p-4 shadow-sm bg-white">
                        <h3 class="display-6 text-danger">358+</h3>
                        <p class="mb-0 text-muted">Hospitals Registered</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card rounded-4 p-4 shadow-sm bg-white">
                        <h3 class="display-6 text-danger">1,420+</h3>
                        <p class="mb-0 text-muted">Available Blood Units</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card rounded-4 p-4 shadow-sm bg-white">
                        <h3 class="display-6 text-danger">8,750+</h3>
                        <p class="mb-0 text-muted">Registered Donors</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stats-card rounded-4 p-4 shadow-sm bg-white">
                        <h3 class="display-6 text-danger">4,120+</h3>
                        <p class="mb-0 text-muted">Successful Donations</p>
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
            // Check session status passed from server
            var isLoggedIn = '<%= Session["UserEmail"] != null ? "true" : "false" %>';
            var userEmail = '<%= Session["UserEmail"] != null ? Session["UserEmail"].ToString().ToLower() : "" %>';

            if (isLoggedIn === "true") {
                // Hide Guest Links (Login / Register)
                document.querySelectorAll('.nav-auth-guest').forEach(function (el) {
                    el.classList.add('d-none');
                });
                // Show User Links (My Profile / Logout)
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