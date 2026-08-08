<%@ Page Title="" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="website_blood.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <%--this is header--%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="BloodConnect is a modern healthcare portal for hospital blood availability and donor management. Find blood fast and save lives." />
        <title>BloodConnect | Find Blood. Save Lives.</title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.4/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css" />
    </head>
    <body>
        <div id="pageLoader" class="page-loader d-flex align-items-center justify-content-center">
            <div class="spinner-border text-white" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
        
        <noscript>
            <%-- 
             NOSCRIPT NOTICE:
             This message ONLY appears if the user turned off JavaScript in their browser.
             It gives them simple direct links so they don't get stuck on a broken page.
            --%>
    <div style="position:fixed;inset:0;display:flex;align-items:center;justify-content:center;background:rgba(0,0,0,0.6);z-index:1060;padding:20px;">
        <div style="background:white;border-radius:12px;padding:20px;max-width:520px;width:100%;text-align:center;">
            <h5 style="color:#D32F2F;margin-bottom:12px;">JavaScript is disabled</h5>
            <p style="color:#6c7280;margin-bottom:12px;">Use the links below to open pages directly.</p>
            <div style="display:flex;flex-wrap:wrap;gap:8px;justify-content:center;">
                <a href="pages/search-blood.aspx" style="padding:8px 12px;background:#D32F2F;color:#fff;border-radius:6px;">Search Blood</a>
                <a href="pages/hospitals.aspx" style="padding:8px 12px;background:#1565C0;color:#fff;border-radius:6px;">Hospitals</a>
                <a href="pages/become-donor.aspx" style="padding:8px 12px;background:#6c757d;color:#fff;border-radius:6px;">Donor</a>
                <a href="pages/request-blood.aspx" style="padding:8px 12px;background:#f59e0b;color:#111;border-radius:6px;">Request</a>
            </div>
        </div>
    </div>
</noscript>

        <header class="sticky-top shadow-sm bg-white">
            <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
                <div class="container">
                    <asp:HyperLink ID="lnkBrand" runat="server" NavigateUrl="~/index.aspx" CssClass="navbar-brand fw-bold text-danger">BloodConnect</asp:HyperLink>
                    
                    <%-- Replaced HTML button with ASP.NET LinkButton for the responsive toggler --%>
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
                                <asp:HyperLink ID="lnkAbout" runat="server" NavigateUrl="~/about.aspx" CssClass="nav-link">About</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="lnkContact" runat="server" NavigateUrl="~/contact.aspx" CssClass="nav-link">Contact</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/login.aspx" CssClass="btn btn-outline-danger btn-sm ms-lg-3">Login</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/register.aspx" CssClass="btn btn-danger btn-sm ms-2">Register</asp:HyperLink>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>              
</asp:Content>

                                                   <%--STARTING OF MAIN CONTENT OF HOME/INDEX PAGE--%>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
                <%--this is Main--%>
<main>
    <section id="home" class="hero-section position-relative overflow-hidden">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-lg-6 text-white">
                    <span class="badge bg-light text-danger mb-3">Emergency Blood Network</span>
                    <h1 class="display-5 fw-bold">BloodConnect</h1>
                    <p class="lead text-white-75">
                        Find nearby hospitals with available blood units instantly and request help in seconds.</p>
                    <div class="d-flex flex-wrap gap-3 mt-4">
                        <asp:HyperLink ID="lnkHeroSearch" runat="server" NavigateUrl="~/search-blood.aspx" CssClass="btn btn-light btn-lg shadow-sm">Search Blood</asp:HyperLink>
                        <asp:HyperLink ID="lnkHeroDonor" runat="server" NavigateUrl="~/become-donor.aspx" CssClass="btn btn-outline-light btn-lg shadow-sm">Become Donor</asp:HyperLink>
                    </div>
                </div>
                <div class="col-lg-6 mt-5 mt-lg-0">
                    <div class="hero-card p-4 rounded-4 shadow-lg bg-white bg-opacity-90">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div>
                                <h2 class="h4 text-danger mb-1">Emergency Assistance</h2>
                                <p class="mb-0 text-muted">
                                    Search blood availability across verified hospitals.</p>
                            </div>
                            <div class="badge bg-danger-subtle text-danger">
                                24x7</div>
                        </div>
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label">
                                City</label>
                                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-select">
                                    <asp:ListItem Selected="True" Value="New Delhi">New Delhi</asp:ListItem>
                                    <asp:ListItem Value="Mumbai">Mumbai</asp:ListItem>
                                    <asp:ListItem Value="Kolkata">Kolkata</asp:ListItem>
                                    <asp:ListItem Value="Bengaluru">Bengaluru</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </div>
                            <div class="col-12">
                                <label class="form-label">
                                Blood Group</label>
                                <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="form-select">
                                    <asp:ListItem Selected="True" Value="A+">A+</asp:ListItem>
                                    <asp:ListItem Value="B+">B+</asp:ListItem>
                                    <asp:ListItem Value="O+">O+</asp:ListItem>
                                    <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-12 d-grid">
                                <asp:Button ID="btnSearchAvailability" runat="server" Text="Search Availability" CssClass="btn btn-danger btn-lg" UseSubmitBehavior="false" />
                            </div>
                        </div>
                        <div class="mt-4">
                            <div class="d-flex align-items-center justify-content-between mb-3">
                                <span class="text-muted">Top result</span> <span class="badge bg-success">Available</span>
                            </div>
                            <div class="border rounded-3 p-3 bg-white shadow-sm">
                                <h5 class="mb-1">City Care Hospital</h5>
                                <p class="mb-2 small text-muted">
                                    A+ units available: 12</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="small text-muted"><i class="bi bi-geo-alt-fill me-1"></i>New Delhi</span> 
                                    <asp:HyperLink ID="lnkTopResultRequest" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-sm btn-danger">Request Blood</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container py-5">
        <div class="row g-4 text-center">
            <div class="col-md-3">
                <div class="stats-card rounded-4 p-4 shadow-sm">
                    <h3 class="display-6 text-danger">358</h3>
                    <p class="mb-0 text-muted">
                        Hospitals Registered</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card rounded-4 p-4 shadow-sm">
                    <h3 class="display-6 text-danger">1,420</h3>
                    <p class="mb-0 text-muted">
                        Available Blood Units</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card rounded-4 p-4 shadow-sm">
                    <h3 class="display-6 text-danger">8,750</h3>
                    <p class="mb-0 text-muted">
                        Registered Donors</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card rounded-4 p-4 shadow-sm">
                    <h3 class="display-6 text-danger">4,120</h3>
                    <p class="mb-0 text-muted">
                        Successful Donations</p>
                </div>
            </div>
        </div>
    </section>

    <section class="container py-5" id="search">
        <div class="row align-items-center">
            <div class="col-lg-5">
                <div class="section-header mb-4">
                    <span class="badge bg-danger bg-opacity-10 text-danger mb-2">Why BloodConnect</span>
                    <h2 class="fw-bold">A modern portal with government-grade verification and hospital trust.</h2>
                </div>
                <p class="text-muted">
                    Use the intelligent emergency search to find blood inventory, hospital details, and fast request actions. The portal is designed for families, hospitals, and first responders.</p>
            </div>
            <div class="col-lg-7">
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="feature-card rounded-4 p-4 h-100 shadow-sm border-0">
                            <div class="icon-box bg-danger-subtle text-danger mb-3">
                                <i class="bi bi-search-heart-fill"></i>
                            </div>
                            <h5>Instant Blood Search</h5>
                            <p class="text-muted mb-0">
                                Find exact availability in your city with precise filtering.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="feature-card rounded-4 p-4 h-100 shadow-sm border-0">
                            <div class="icon-box bg-primary-subtle text-primary mb-3">
                                <i class="bi bi-hospital-fill"></i>
                            </div>
                            <h5>Verified Hospitals</h5>
                            <p class="text-muted mb-0">
                                Only trusted hospital partners with real-time inventory tracking.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="feature-card rounded-4 p-4 h-100 shadow-sm border-0">
                            <div class="icon-box bg-success-subtle text-success mb-3">
                                <i class="bi bi-bandaid-fill"></i>
                            </div>
                            <h5>Easy Blood Request</h5>
                            <p class="text-muted mb-0">
                                Submit urgency, select hospital, and receive confirmation fast.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="feature-card rounded-4 p-4 h-100 shadow-sm border-0">
                            <div class="icon-box bg-warning-subtle text-warning mb-3">
                                <i class="bi bi-heart-pulse-fill"></i>
                            </div>
                            <h5>Save Lives</h5>
                            <p class="text-muted mb-0">
                                Connect donors, hospitals, and families with an accessible platform.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="bg-light py-5" id="hospitals">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <span class="badge bg-danger bg-opacity-10 text-danger">Featured Hospitals</span>
                    <h2 class="mt-3">Nearby Hospitals with Emergency Blood Stock</h2>
                </div>
                <asp:HyperLink ID="lnkViewAllHospitals" runat="server" NavigateUrl="~/hospitals.aspx" CssClass="btn btn-outline-danger">View All Hospitals</asp:HyperLink>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-xl-4">
                    <div class="hospital-card rounded-4 p-4 shadow-sm bg-white h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <span class="badge bg-danger bg-opacity-10 text-danger">Emergency</span> <span class="text-muted small"><i class="bi bi-telephone-fill me-1"></i>+91 281 123 4567</span>
                        </div>
                        <h5>Rajkot Civil Hospital</h5>
                        <p class="text-muted small">
                            Rajkot, Gujarat</p>
                        <div class="mb-3">
                            <span class="badge bg-danger-subtle text-danger me-2">A+</span> <span class="badge bg-primary-subtle text-primary me-2">A-</span> <span class="badge bg-success-subtle text-success me-2">B+</span> <span class="badge bg-warning-subtle text-warning me-2">B-</span> <span class="badge bg-info-subtle text-info me-2">O+</span> <span class="badge bg-secondary-subtle text-secondary">O-</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted small">Blood group range available</span> 
                            <asp:HyperLink ID="lnkHospReq1" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-sm btn-danger">Request</asp:HyperLink>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4">
                    <div class="hospital-card rounded-4 p-4 shadow-sm bg-white h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <span class="badge bg-primary bg-opacity-10 text-primary">Verified</span> <span class="text-muted small"><i class="bi bi-telephone-fill me-1"></i>+91 281 765 4321</span>
                        </div>
                        <h5>Rajkot Civil Blood Bank</h5>
                        <p class="text-muted small">
                            Rajkot, Gujarat</p>
                        <div class="mb-3">
                            <span class="badge bg-danger-subtle text-danger me-2">AB+</span> <span class="badge bg-primary-subtle text-primary me-2">AB-</span> <span class="badge bg-success-subtle text-success me-2">O+</span> <span class="badge bg-warning-subtle text-warning me-2">O-</span> <span class="badge bg-info-subtle text-info me-2">B+</span> <span class="badge bg-secondary-subtle text-secondary">B-</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted small">Multiple blood groups ready</span> 
                            <asp:HyperLink ID="lnkHospReq2" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-sm btn-danger">Request</asp:HyperLink>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-xl-4">
                    <div class="hospital-card rounded-4 p-4 shadow-sm bg-white h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <span class="badge bg-success bg-opacity-10 text-success">Trusted</span> <span class="text-muted small"><i class="bi bi-telephone-fill me-1"></i>+91 281 654 3210</span>
                        </div>
                        <h5>MVM Hospital Rajkot</h5>
                        <p class="text-muted small">
                            Rajkot, Gujarat</p>
                        <div class="mb-3">
                            <span class="badge bg-danger-subtle text-danger me-2">A+</span> <span class="badge bg-primary-subtle text-primary me-2">A-</span> <span class="badge bg-success-subtle text-success me-2">B+</span> <span class="badge bg-warning-subtle text-warning me-2">B-</span> <span class="badge bg-info-subtle text-info me-2">AB+</span> <span class="badge bg-secondary-subtle text-secondary">AB-</span> <span class="badge bg-dark-subtle text-dark">O+</span> <span class="badge bg-light-subtle text-muted">O-</span>
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted small">Complete blood-group support</span> 
                            <asp:HyperLink ID="lnkHospReq3" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-sm btn-danger">Request</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="container py-5">
        <div class="text-center mb-5">
            <span class="badge bg-danger bg-opacity-10 text-danger">How It Works</span>
            <h2 class="mt-3">Simple steps to connect blood needs with trusted hospitals</h2>
        </div>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="process-card rounded-4 p-4 shadow-sm h-100">
                    <div class="process-icon bg-danger-subtle text-danger mb-3">
                        <i class="bi bi-search"></i>
                    </div>
                    <h5>Search Blood</h5>
                    <p class="text-muted">
                        Select city and blood group to view availability instantly.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="process-card rounded-4 p-4 shadow-sm h-100">
                    <div class="process-icon bg-primary-subtle text-primary mb-3">
                        <i class="bi bi-building"></i>
                    </div>
                    <h5>Choose Hospital</h5>
                    <p class="text-muted">
                        Review hospital details and urgent contact information.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="process-card rounded-4 p-4 shadow-sm h-100">
                    <div class="process-icon bg-success-subtle text-success mb-3">
                        <i class="bi bi-chat-dots"></i>
                    </div>
                    <h5>Request Blood</h5>
                    <p class="text-muted">
                        Submit a simple request with patient and emergency details.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="process-card rounded-4 p-4 shadow-sm h-100">
                    <div class="process-icon bg-warning-subtle text-warning mb-3">
                        <i class="bi bi-check-circle"></i>
                    </div>
                    <h5>Receive Confirmation</h5>
                    <p class="text-muted">
                        Get a confirmation message and hospital pickup instructions.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="cta-banner py-5 text-white text-center" style="background: linear-gradient(135deg, rgba(211,47,47,0.95), rgba(21,101,192,0.9));">
        <div class="container">
            <h2 class="fw-bold">Become a blood donor and support your community.</h2>
            <p class="lead mb-4 text-white-75">
                Your donation can be the difference between life and death. Join the BloodConnect donor community today.</p>
            <asp:HyperLink ID="lnkCtaRegisterDonor" runat="server" NavigateUrl="~/become-donor.aspx" CssClass="btn btn-light btn-lg">Register as a Donor</asp:HyperLink>
        </div>
    </section>
</main>
</asp:Content>
                                                            <%--FOOTER--%> 

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder3">
                <%--this is footer--%>
                <footer class="footer bg-white py-5 border-top">
                    <div class="container">
                        <div class="row gy-4">
                            <div class="col-lg-4">
                                <h5 class="text-danger fw-bold">BloodConnect</h5>
                                <p class="text-muted">
                                    A reliable portal for emergency blood availability, hospital coordination, and donor support with a modern, accessible experience.</p>
                                <div class="d-flex gap-3">
                                    <a href="#" class="text-muted fs-5"><i class="bi bi-facebook"></i></a>
                                    <a href="#" class="text-muted fs-5"><i class="bi bi-twitter"></i></a>
                                    <a href="#" class="text-muted fs-5"><i class="bi bi-instagram"></i></a>
                                </div>
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
                                <p class="mb-1">
                                    <i class="bi bi-telephone-fill me-2 text-danger"></i>National Helpline: 112</p>
                                <p class="mb-1">
                                    <i class="bi bi-envelope-fill me-2 text-danger"></i>support@bloodconnect.org</p>
                                <p class="mb-0">
                                    <i class="bi bi-geo-alt-fill me-2 text-danger"></i>New Delhi, India</p>
                            </div>
                            <div class="col-lg-3">
                                <h6>Need Assistance</h6>
                                <p class="mb-1 text-muted">
                                    Contact our help desk for hospital coordination and donor scheduling.</p>
                                <p class="mb-0 fw-semibold">
                                    Help Desk: +91 99887 66554</p>
                            </div>
                        </div>
                        <div class="text-center mt-4 text-muted small">
                            &copy; 2026 BloodConnect. All rights reserved.</div>
                    </div>
    </footer>
    <button id="scrollTopBtn" type="button" class="btn btn-danger rounded-circle shadow-lg">
        <i class="bi bi-arrow-up"></i>
    </button>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/script.js"></script></body></html>

            </asp:Content>

