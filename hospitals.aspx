<%@ Page Title="" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="hospitals.aspx.cs" Inherits="website_blood.hospitals" %>
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

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
                <%--the main content of hospital page --%>

    <main class="bg-light py-5">
    <div class="container">
        <div class="text-center mb-5">
            <span class="badge bg-danger bg-opacity-10 text-danger">Hospital Directory</span>
            <h1 class="fw-bold mt-3">Trusted Hospital Partners</h1>
            <p class="text-muted">Search hospitals, review contact details, and see available blood groups at a glance.</p>
        </div>

        <div class="row g-4">
            <!-- Hospital Card 1 -->
            <div class="col-md-6 col-xl-4">
                <div class="card rounded-4 shadow-sm border-0 h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3">
                            <span class="badge bg-danger bg-opacity-10 text-danger">Verified</span>
                            <span class="text-muted small">New Delhi</span>
                        </div>
                        <h5>National Health Centre</h5>
                        <p class="text-muted small">Sector 22, New Delhi</p>
                        <p class="mb-3"><i class="bi bi-telephone-fill me-2"></i>+91 98765 43210</p>
                        <div class="mb-3">
                            <span class="badge bg-danger-subtle text-danger me-2">O+</span>
                            <span class="badge bg-primary-subtle text-primary me-2">A+</span>
                            <span class="badge bg-success-subtle text-success">B+</span>
                        </div>
                        <div class="d-flex gap-2">
                            <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#hospitalModal1">View Details</button>
                            <asp:HyperLink ID="lnkMap1" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-danger btn-sm">Map</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Hospital Card 2 -->
            <div class="col-md-6 col-xl-4">
                <div class="card rounded-4 shadow-sm border-0 h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3">
                            <span class="badge bg-primary bg-opacity-10 text-primary">Trusted</span>
                            <span class="text-muted small">Mumbai</span>
                        </div>
                        <h5>City Care Hospital</h5>
                        <p class="text-muted small">Andheri East, Mumbai</p>
                        <p class="mb-3"><i class="bi bi-telephone-fill me-2"></i>+91 91234 56789</p>
                        <div class="mb-3">
                            <span class="badge bg-danger-subtle text-danger me-2">AB-</span>
                            <span class="badge bg-primary-subtle text-primary me-2">O-</span>
                            <span class="badge bg-success-subtle text-success">A-</span>
                        </div>
                        <div class="d-flex gap-2">
                            <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#hospitalModal2">View Details</button>
                            <asp:HyperLink ID="lnkMap2" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-danger btn-sm">Map</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Hospital Card 3 -->
            <div class="col-md-6 col-xl-4">
                <div class="card rounded-4 shadow-sm border-0 h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3">
                            <span class="badge bg-success bg-opacity-10 text-success">Recommended</span>
                            <span class="text-muted small">Bengaluru</span>
                        </div>
                        <h5>Metro Medical Centre</h5>
                        <p class="text-muted small">Koramangala, Bengaluru</p>
                        <p class="mb-3"><i class="bi bi-telephone-fill me-2"></i>+91 99887 66554</p>
                        <div class="mb-3">
                            <span class="badge bg-danger-subtle text-danger me-2">B-</span>
                            <span class="badge bg-primary-subtle text-primary me-2">AB+</span>
                            <span class="badge bg-success-subtle text-success">O+</span>
                        </div>
                        <div class="d-flex gap-2">
                            <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#hospitalModal3">View Details</button>
                            <asp:HyperLink ID="lnkMap3" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-danger btn-sm">Map</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal 1 -->
    <div class="modal fade" id="hospitalModal1" tabindex="-1" aria-labelledby="hospitalModal1Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-sm">
                <div class="modal-header">
                    <h5 class="modal-title" id="hospitalModal1Label">National Health Centre</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="text-muted">Sector 22, New Delhi</p>
                    <p><strong>Available Blood Groups:</strong> O+, A+, B+, AB+</p>
                    <p class="mb-0"><strong>Emergency Contact:</strong> +91 98765 43210</p>
                </div>
                <div class="modal-footer">
                    <asp:HyperLink ID="lnkReqModal1" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-danger">Request Blood</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal 2 -->
    <div class="modal fade" id="hospitalModal2" tabindex="-1" aria-labelledby="hospitalModal2Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-sm">
                <div class="modal-header">
                    <h5 class="modal-title" id="hospitalModal2Label">City Care Hospital</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="text-muted">Andheri East, Mumbai</p>
                    <p><strong>Available Blood Groups:</strong> AB-, O-, A-</p>
                    <p class="mb-0"><strong>Emergency Contact:</strong> +91 91234 56789</p>
                </div>
                <div class="modal-footer">
                    <asp:HyperLink ID="lnkReqModal2" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-danger">Request Blood</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal 3 -->
    <div class="modal fade" id="hospitalModal3" tabindex="-1" aria-labelledby="hospitalModal3Label" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-4 border-0 shadow-sm">
                <div class="modal-header">
                    <h5 class="modal-title" id="hospitalModal3Label">Metro Medical Centre</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p class="text-muted">Koramangala, Bengaluru</p>
                    <p><strong>Available Blood Groups:</strong> B-, AB+, O+</p>
                    <p class="mb-0"><strong>Emergency Contact:</strong> +91 99887 66554</p>
                </div>
                <div class="modal-footer">
                    <asp:HyperLink ID="lnkReqModal3" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="btn btn-danger">Request Blood</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</main>
</asp:Content>


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



