<%@ Page Title="" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="website_blood.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
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

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder3">
              <%--this is footer--%>
              <footer class="footer bg-white py-5 border-top">
                  <div class="container">
                      <div class="row gy-4">
                          <div class="col-lg-4">
                              <h5 class="text-danger fw-bold">BloodConnect</h5>
                              <p class="text-muted">
                                  A reliable portal for emergency blood availability, hospital coordination, and donor support with a modern, accessible experience.</p>
                              <div class="d-flex gap-3">
                                  <a class="text-muted fs-5" href="#"><i class="bi bi-facebook"></i><i class="bi bi-twitter"></i><i class="bi bi-instagram"></i></a>
                              </div>
                          </div>
                          <div class="col-lg-2">
                              <h6>Quick Links</h6>
                              <ul class="list-unstyled">
                                  <li>
                                      <asp:HyperLink ID="lnkFooterHome" runat="server" CssClass="footer-link" NavigateUrl="~/index.aspx">Home</asp:HyperLink>
                                  </li>
                                  <li>
                                      <asp:HyperLink ID="lnkFooterHospitals" runat="server" CssClass="footer-link" NavigateUrl="~/hospitals.aspx">Hospitals</asp:HyperLink>
                                  </li>
                                  <li>
                                      <asp:HyperLink ID="lnkFooterAbout" runat="server" CssClass="footer-link" NavigateUrl="~/about.aspx">About</asp:HyperLink>
                                  </li>
                                  <li>
                                      <asp:HyperLink ID="lnkFooterContact" runat="server" CssClass="footer-link" NavigateUrl="~/contact.aspx">Contact</asp:HyperLink>
                                  </li>
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
                          © 2026 BloodConnect. All rights reserved.</div>
                  </div>
    </footer>
    <button id="scrollTopBtn" class="btn btn-danger rounded-circle shadow-lg" type="button">
        <i class="bi bi-arrow-up"></i>
    </button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/script.js"></script>
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder2">
                
    <%--this is main content of about page--%>
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
                    <p class="text-muted">A future where urgent blood needs are matched intelligently with verified donors and hospital resources across the country. We envision a India where no life is lost due to the unavailability of blood during critical moments.</p>
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
                <div class="stats-card rounded-4 p-4 shadow-sm">
                    <h3 class="display-6 text-danger">358+</h3>
                    <p class="mb-0 text-muted">Hospitals Registered</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card rounded-4 p-4 shadow-sm">
                    <h3 class="display-6 text-danger">1,420+</h3>
                    <p class="mb-0 text-muted">Available Blood Units</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card rounded-4 p-4 shadow-sm">
                    <h3 class="display-6 text-danger">8,750+</h3>
                    <p class="mb-0 text-muted">Registered Donors</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stats-card rounded-4 p-4 shadow-sm">
                    <h3 class="display-6 text-danger">4,120+</h3>
                    <p class="mb-0 text-muted">Successful Donations</p>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works & Accordion -->
    <section class="container py-5">
        <div class="row gx-4 gy-4">
            <div class="col-lg-6">
                <div class="accordion rounded-4 shadow-sm" id="govAccordion">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                <i class="bi bi-building text-danger me-2"></i> Public Utility Design
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#govAccordion">
                            <div class="accordion-body text-muted">The interface is designed for accessibility, fast data lookup, and clear decision paths for emergency users. Every element is optimized for quick scanning and immediate action — critical when every second matters.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <i class="bi bi-shield-check text-primary me-2"></i> Information Transparency
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#govAccordion">
                            <div class="accordion-body text-muted">Hospital verification, contact details, and availability statuses are clearly labeled for trust and speed. We partner only with verified healthcare institutions to ensure data accuracy and reliability.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <i class="bi bi-heart-pulse text-success me-2"></i> Support for Donors
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#govAccordion">
                            <div class="accordion-body text-muted">Donor registration is simple, modern, and integrated with hospital demand workflows. Registered donors receive real-time alerts when their blood type is urgently needed in their area.</div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                <i class="bi bi-clock-history text-warning me-2"></i> 24/7 Emergency Response
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#govAccordion">
                            <div class="accordion-body text-muted">Our emergency response team is available around the clock to coordinate between hospitals, donors, and families. National helpline <strong>112</strong> connects you directly to the nearest blood bank.</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="card rounded-4 shadow-sm border-0 p-4 h-100">
                    <h5 class="fw-bold">Why this portal matters</h5>
                    <p class="text-muted">BloodConnect is built to reduce response time during emergencies by offering a clear, structured discovery process for blood availability inside hospital networks. Unlike traditional methods that rely on phone calls and manual coordination, our platform provides instant access to:</p>
                    <div class="row g-3">
                        <div class="col-sm-6">
                            <div class="p-3 bg-danger-subtle rounded-4">
                                <p class="mb-1 text-danger fw-semibold"><i class="bi bi-search me-1"></i>Fast Access</p>
                                <p class="small text-muted mb-0">Search results in seconds with real-time hospital blood stock data.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="p-3 bg-primary-subtle rounded-4">
                                <p class="mb-1 text-primary fw-semibold"><i class="bi bi-shield-check me-1"></i>Verified Data</p>
                                <p class="small text-muted mb-0">Hospital stock confidence with regularly updated inventory.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="p-3 bg-success-subtle rounded-4">
                                <p class="mb-1 text-success fw-semibold"><i class="bi bi-people me-1"></i>Donor Support</p>
                                <p class="small text-muted mb-0">Register and stay notified about urgent donation needs.</p>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="p-3 bg-warning-subtle rounded-4">
                                <p class="mb-1 text-warning fw-semibold"><i class="bi bi-telephone me-1"></i>24/7 Help</p>
                                <p class="small text-muted mb-0">Emergency contact line with national helpline integration.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="container py-5">
        <div class="text-center mb-5">
            <span class="badge bg-danger bg-opacity-10 text-danger">Our Team</span>
            <h2 class="fw-bold mt-3">Meet the People Behind BloodConnect</h2>
            <p class="text-muted">A dedicated team of healthcare professionals, technologists, and community volunteers working tirelessly to save lives.</p>
        </div>
        <div class="row g-4 justify-content-center">
            <div class="col-md-4 col-lg-3">
                <div class="card rounded-4 shadow-sm border-0 h-100 text-center p-4">
                    <div class="mx-auto mb-3" style="width: 80px; height: 80px; background: linear-gradient(135deg, rgba(211,47,47,0.15), rgba(21,101,192,0.15)); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-person-circle fs-1 text-danger"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Dr. Arjun Mehta</h6>
                    <small class="text-muted">Founder & Director</small>
                    <p class="small text-muted mt-2 mb-0">20+ years in public healthcare administration and emergency response coordination.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3">
                <div class="card rounded-4 shadow-sm border-0 h-100 text-center p-4">
                    <div class="mx-auto mb-3" style="width: 80px; height: 80px; background: linear-gradient(135deg, rgba(211,47,47,0.15), rgba(21,101,192,0.15)); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-person-circle fs-1 text-primary"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Priya Sharma</h6>
                    <small class="text-muted">Head of Operations</small>
                    <p class="small text-muted mt-2 mb-0">Expert in hospital network management and blood bank logistics across India.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3">
                <div class="card rounded-4 shadow-sm border-0 h-100 text-center p-4">
                    <div class="mx-auto mb-3" style="width: 80px; height: 80px; background: linear-gradient(135deg, rgba(211,47,47,0.15), rgba(21,101,192,0.15)); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-person-circle fs-1 text-success"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Rahul Verma</h6>
                    <small class="text-muted">Technical Lead</small>
                    <p class="small text-muted mt-2 mb-0">Full-stack developer with expertise in building scalable healthcare platforms.</p>
                </div>
            </div>
            <div class="col-md-4 col-lg-3">
                <div class="card rounded-4 shadow-sm border-0 h-100 text-center p-4">
                    <div class="mx-auto mb-3" style="width: 80px; height: 80px; background: linear-gradient(135deg, rgba(211,47,47,0.15), rgba(21,101,192,0.15)); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-person-circle fs-1 text-warning"></i>
                    </div>
                    <h6 class="fw-bold mb-1">Anita Patel</h6>
                    <small class="text-muted">Community Coordinator</small>
                    <p class="small text-muted mt-2 mb-0">Leads donor engagement programs and hospital partnership initiatives nationwide.</p>
                </div>
            </div>
        </div>
    </section>
</main>

</asp:Content>


