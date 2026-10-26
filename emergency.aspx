<%@ Page Title="" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="emergency.aspx.cs" Inherits="website_blood.emergency" %>
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

        <!-- Emergency Sticky Banner Above Navbar -->
<div class="emergency-sticky-top text-white text-center">
    <div class="container d-flex align-items-center justify-content-center justify-content-lg-between flex-wrap gap-2">
        <div class="d-flex align-items-center gap-2">
            <span class="emergency-icon"><i class="bi bi-exclamation-triangle-fill fs-4"></i></span>
            <strong class="fs-6">🚨 Emergency Blood Support - 24/7 Active</strong>
        </div>
        <div class="d-flex align-items-center gap-3 flex-wrap">
            <span><i class="bi bi-telephone-fill me-1"></i> National Helpline: <strong>112</strong></span>
            <span><i class="bi bi-headset me-1"></i> BloodConnect: <strong>+91 99887 66554</strong></span>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-light btn-sm fw-bold text-danger px-3">Request Now</asp:HyperLink>
        </div>
    </div>
</div>

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
   <%-- this is emergency page --%>
    <main>
    <!-- Emergency Hero Banner -->
    <section class="bg-danger text-white py-4">
        <div class="container text-center">
            <h1 class="fw-bold display-6"><i class="bi bi-lightning-fill me-2"></i>Emergency Blood Search</h1>
            <p class="lead mb-0">Find hospitals with available blood instantly. Time is critical — our system connects you to verified blood banks within seconds.</p>
        </div>
    </section>

    <section class="container py-5">
        <div class="row g-4 align-items-start">
            <!-- Emergency Search Panel -->
            <div class="col-lg-6">
                <div class="card rounded-4 shadow-lg border-0 sticky-top" style="top: 160px;">
                    <div class="card-body p-5">
                        <div class="d-flex align-items-center mb-4">
                            <div class="badge bg-danger text-white p-2 me-3"><i class="bi bi-lightning-fill"></i></div>
                            <div>
                                <h4 class="fw-bold mb-0">Emergency Blood Search</h4>
                                <small class="text-muted">Available 24/7</small>
                            </div>
                        </div>

                        <%-- Changed inner <form> to <div> to avoid nested server form errors --%>
                        <div class="row g-3 mt-4">
                            <div class="col-12">
                                <label class="form-label fw-semibold">Select Your City</label>
                                <asp:DropDownList ID="ddlEmergencyCity" runat="server" CssClass="form-select form-select-lg">
                                    <asp:ListItem Value="" Selected="True">Choose City...</asp:ListItem>
                                    <asp:ListItem Value="rajkot">Rajkot</asp:ListItem>
                                    <asp:ListItem Value="delhi">New Delhi</asp:ListItem>
                                    <asp:ListItem Value="mumbai">Mumbai</asp:ListItem>
                                    <asp:ListItem Value="bangalore">Bengaluru</asp:ListItem>
                                    <asp:ListItem Value="hyderabad">Hyderabad</asp:ListItem>
                                    <asp:ListItem Value="kolkata">Kolkata</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-12">
                                <label class="form-label fw-semibold">Blood Group Needed</label>
                                <div class="row g-2">
                                    <div class="col-6"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="A+">A+</button></div>
                                    <div class="col-6"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="A-">A-</button></div>
                                    <div class="col-6"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="B+">B+</button></div>
                                    <div class="col-6"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="B-">B-</button></div>
                                    <div class="col-6"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="O+">O+</button></div>
                                    <div class="col-6"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="O-">O-</button></div>
                                    <div class="col-6"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="AB+">AB+</button></div>
                                    <div class="col-6"><button type="button" class="w-100 btn btn-outline-danger blood-btn" data-blood="AB-">AB-</button></div>
                                </div>
                                <asp:HiddenField ID="hfSelectedBlood" runat="server" />
                            </div>

                            <div class="col-12 d-grid">
                                <asp:Button ID="btnSearch" runat="server" Text="Search Now" CssClass="btn btn-danger btn-lg fw-semibold" OnClientClick="performEmergencySearch(); return false;" />
                            </div>

                            <div class="col-12 text-center">
                                <small class="text-muted"><i class="bi bi-clock-history me-1"></i>Average response: 45 seconds</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Emergency Results Panel -->
            <div class="col-lg-6">
                <div id="emergencyResults">
                    <h5 class="text-center text-muted mb-4">Results will appear here after search</h5>
                    <div class="row g-3">
                        <!-- Sample Hospital 1 -->
                        <div class="col-sm-6">
                            <div class="hospital-result-card rounded-4 overflow-hidden shadow-sm hover-lift bg-white h-100">
                                <div class="position-relative overflow-hidden" style="height: 150px; background: linear-gradient(135deg, rgba(211,47,47,0.1), rgba(21,101,192,0.1));">
                                    <asp:Image ID="imgHospital1" runat="server" ImageUrl="~/Photos/h1.jpg" AlternateText="Hospital" CssClass="w-100 h-100 object-fit-cover" />
                                </div>
                                <div class="p-3">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h6 class="mb-0">City General Hospital</h6>
                                        <span class="badge bg-success">Open</span>
                                    </div>
                                    <p class="mb-2 small text-muted"><i class="bi bi-droplet-half me-1 text-danger"></i>A+ — 8 units</p>
                                    <p class="text-muted small mb-3"><i class="bi bi-geo-alt-fill me-1"></i>Sector 21, New Delhi</p>
                                    <div class="d-flex gap-2">
                                        <asp:HyperLink ID="lnkReq1" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-sm btn-danger flex-grow-1">Request</asp:HyperLink>
                                        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="alert('Call: +91 281 123 4567')">
                                            <i class="bi bi-telephone-fill"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Sample Hospital 2 -->
                        <div class="col-sm-6">
                            <div class="hospital-result-card rounded-4 overflow-hidden shadow-sm hover-lift bg-white h-100">
                                <div class="position-relative overflow-hidden" style="height: 150px; background: linear-gradient(135deg, rgba(211,47,47,0.1), rgba(21,101,192,0.1));">
                                    <asp:Image ID="imgHospital2" runat="server" ImageUrl="~/Photos/h2.jfif" AlternateText="Hospital" CssClass="w-100 h-100 object-fit-cover" />
                                </div>
                                <div class="p-3">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h6 class="mb-0">Hope Care Facility</h6>
                                        <span class="badge bg-success">Open</span>
                                    </div>
                                    <p class="mb-2 small text-muted"><i class="bi bi-droplet-half me-1 text-danger"></i>O- — 5 units</p>
                                    <p class="text-muted small mb-3"><i class="bi bi-geo-alt-fill me-1"></i>Andheri East, Mumbai</p>
                                    <div class="d-flex gap-2">
                                        <asp:HyperLink ID="lnkReq2" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-sm btn-danger flex-grow-1">Request</asp:HyperLink>
                                        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="alert('Call: +91 281 765 4321')">
                                            <i class="bi bi-telephone-fill"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Sample Hospital 3 -->
                        <div class="col-sm-6">
                            <div class="hospital-result-card rounded-4 overflow-hidden shadow-sm hover-lift bg-white h-100">
                                <div class="position-relative overflow-hidden" style="height: 150px; background: linear-gradient(135deg, rgba(211,47,47,0.1), rgba(21,101,192,0.1));">
                                    <asp:Image ID="imgHospital3" runat="server" ImageUrl="~/Photos/h3.jfif" AlternateText="Hospital" CssClass="w-100 h-100 object-fit-cover" />
                                </div>
                                <div class="p-3">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h6 class="mb-0">Red Cross Hospital</h6>
                                        <span class="badge bg-success">Open</span>
                                    </div>
                                    <p class="mb-2 small text-muted"><i class="bi bi-droplet-half me-1 text-danger"></i>B+ — 10 units</p>
                                    <p class="text-muted small mb-3"><i class="bi bi-geo-alt-fill me-1"></i>Koramangala, Bengaluru</p>
                                    <div class="d-flex gap-2">
                                        <asp:HyperLink ID="lnkReq3" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-sm btn-danger flex-grow-1">Request</asp:HyperLink>
                                        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="alert('Call: +91 281 654 3210')">
                                            <i class="bi bi-telephone-fill"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Sample Hospital 4 -->
                        <div class="col-sm-6">
                            <div class="hospital-result-card rounded-4 overflow-hidden shadow-sm hover-lift bg-white h-100">
                                <div class="position-relative overflow-hidden" style="height: 150px; background: linear-gradient(135deg, rgba(211,47,47,0.1), rgba(21,101,192,0.1));">
                                    <asp:Image ID="imgHospital4" runat="server" ImageUrl="~/Photos/bb1.jpg" AlternateText="Blood Bank" CssClass="w-100 h-100 object-fit-cover" />
                                </div>
                                <div class="p-3">
                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                        <h6 class="mb-0">Metro Health Hub</h6>
                                        <span class="badge bg-success">Open</span>
                                    </div>
                                    <p class="mb-2 small text-muted"><i class="bi bi-droplet-half me-1 text-danger"></i>AB+ — 4 units</p>
                                    <p class="text-muted small mb-3"><i class="bi bi-geo-alt-fill me-1"></i>Salt Lake, Kolkata</p>
                                    <div class="d-flex gap-2">
                                        <asp:HyperLink ID="lnkReq4" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-sm btn-danger flex-grow-1">Request</asp:HyperLink>
                                        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="alert('Call: +91 281 456 7890')">
                                            <i class="bi bi-telephone-fill"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Emergency Hotline Info -->
        <div class="alert alert-danger alert-dismissible fade show mt-5 mb-0" role="alert">
            <div class="row align-items-center">
                <div class="col-auto">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i><strong>Emergency Support Available 24/7</strong>
                </div>
                <div class="col-auto ms-auto">
                    <strong>National Helpline: 112</strong> | BloodConnect Support: <strong>+91 99887 66554</strong>
                </div>
            </div>
        </div>
    </section>
</main>

</asp:Content>


