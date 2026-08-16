<%@ Page Title="Request Blood - BloodConnect" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="request-blood.aspx.cs" Inherits="website_blood.request_blood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Meta and Fonts -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Submit an emergency blood request on BloodConnect to connect with nearby hospitals and blood banks." />
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
                            <asp:HyperLink ID="lnkRequestBlood" runat="server" NavigateUrl="~/request-blood.aspx" CssClass="nav-link active">Request Blood</asp:HyperLink>
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

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- MAIN REQUEST BLOOD CONTENT -->
    <main class="bg-light py-5">
        <div class="container">
            <div class="text-center mb-5">
                <span class="badge bg-danger bg-opacity-10 text-danger">Blood Request</span>
                <h1 class="fw-bold mt-3">Submit an Emergency Blood Request</h1>
                <p class="text-muted">Provide patient details, hospital selection, and emergency priority for rapid action.</p>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card rounded-4 shadow-sm border-0 p-4 bg-white">
                        <div class="row g-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Patient Name</label>
                                <asp:TextBox ID="txtPatientName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">City</label>
                                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Selected="True" Disabled="True">Select City</asp:ListItem>
                                    <asp:ListItem Value="Rajkot">Rajkot</asp:ListItem>
                                    <asp:ListItem Value="Ahmedabad">Ahmedabad</asp:ListItem>
                                    <asp:ListItem Value="Surat">Surat</asp:ListItem>
                                    <asp:ListItem Value="Vadodara">Vadodara</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Hospital</label>
                                <asp:DropDownList ID="ddlHospital" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlHospital_SelectedIndexChanged">
                                    <asp:ListItem Value="" Selected="True" Disabled="True">Select Hospital</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Blood Group</label>
                                <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Selected="True" Disabled="True">Select</asp:ListItem>
                                    <asp:ListItem Value="A+">A+</asp:ListItem>
                                    <asp:ListItem Value="A-">A-</asp:ListItem>
                                    <asp:ListItem Value="B+">B+</asp:ListItem>
                                    <asp:ListItem Value="B-">B-</asp:ListItem>
                                    <asp:ListItem Value="AB+">AB+</asp:ListItem>
                                    <asp:ListItem Value="AB-">AB-</asp:ListItem>
                                    <asp:ListItem Value="O+">O+</asp:ListItem>
                                    <asp:ListItem Value="O-">O-</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-4">
                                <label class="form-label fw-semibold">Units Required</label>
                                <asp:TextBox ID="txtUnitsRequired" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div class="col-md-4">
                                <label class="form-label fw-semibold">Emergency Level</label>
                                <asp:DropDownList ID="ddlEmergencyLevel" runat="server" CssClass="form-select">
                                    <asp:ListItem Value="" Selected="True" Disabled="True">Choose priority</asp:ListItem>
                                    <asp:ListItem Value="Critical">Critical</asp:ListItem>
                                    <asp:ListItem Value="High">High</asp:ListItem>
                                    <asp:ListItem Value="Normal">Normal</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="col-md-4">
                                <label class="form-label fw-semibold">Hospital Contact</label>
                                <asp:TextBox ID="txtHospitalContact" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                <div class="form-text">Contact updates when hospital is selected.</div>
                            </div>

                            <div class="col-12">
                                <label class="form-label fw-semibold">Reason</label>
                                <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>
                            </div>

                            <!-- Alert Output Label -->
                            <div class="col-12">
                                <asp:Label ID="lblStatusMessage" runat="server" Visible="false" role="alert"></asp:Label>
                            </div>

                            <div class="col-12 d-grid">
                                <asp:Button ID="btnSubmitRequest" runat="server" Text="Submit Request" CssClass="btn btn-danger btn-lg fw-semibold" OnClick="btnSubmitRequest_Click" OnClientClick="return validateRequestForm();" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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

        // Request Form Client-Side Validation
        function validateRequestForm() {
            var isLoggedIn = '<%= Session["UserEmail"] != null ? "true" : "false" %>';

            // Check if user is logged in
            if (isLoggedIn !== "true") {
                alert("Please log in to submit a blood request.");
                window.location.href = "login.aspx";
                return false;
            }

            var isValid = true;

            var txtPatientName = document.getElementById('<%= txtPatientName.ClientID %>');
            var ddlCity = document.getElementById('<%= ddlCity.ClientID %>');
            var ddlHospital = document.getElementById('<%= ddlHospital.ClientID %>');
            var ddlBloodGroup = document.getElementById('<%= ddlBloodGroup.ClientID %>');
            var txtUnitsRequired = document.getElementById('<%= txtUnitsRequired.ClientID %>');
            var ddlEmergencyLevel = document.getElementById('<%= ddlEmergencyLevel.ClientID %>');
            var txtReason = document.getElementById('<%= txtReason.ClientID %>');

            // Clear old error messages
            var oldErrors = document.querySelectorAll('.js-validation-error');
            oldErrors.forEach(function (el) {
                el.remove();
            });

            function showError(input, message) {
                input.classList.add('is-invalid');
                var errorDiv = document.createElement('div');
                errorDiv.className = 'invalid-feedback js-validation-error';
                errorDiv.innerText = message;
                input.parentNode.appendChild(errorDiv);
                isValid = false;
            }

            function clearError(input) {
                input.classList.remove('is-invalid');
            }

            // Validate Patient Name
            clearError(txtPatientName);
            if (txtPatientName.value.trim() === "") {
                showError(txtPatientName, "Please enter the patient name.");
            }

            // Validate City
            clearError(ddlCity);
            if (ddlCity.value === "" || ddlCity.selectedIndex === 0) {
                showError(ddlCity, "Please select a city.");
            }

            // Validate Hospital
            clearError(ddlHospital);
            if (ddlHospital.value === "" || ddlHospital.selectedIndex === 0) {
                showError(ddlHospital, "Please select a hospital.");
            }

            // Validate Blood Group
            clearError(ddlBloodGroup);
            if (ddlBloodGroup.value === "" || ddlBloodGroup.selectedIndex === 0) {
                showError(ddlBloodGroup, "Please select a blood group.");
            }

            // Validate Units Required
            clearError(txtUnitsRequired);
            var units = parseInt(txtUnitsRequired.value.trim(), 10);
            if (txtUnitsRequired.value.trim() === "" || isNaN(units) || units <= 0) {
                showError(txtUnitsRequired, "Please enter valid units (at least 1).");
            }

            // Validate Emergency Level
            clearError(ddlEmergencyLevel);
            if (ddlEmergencyLevel.value === "" || ddlEmergencyLevel.selectedIndex === 0) {
                showError(ddlEmergencyLevel, "Please select an emergency level.");
            }

            // Validate Reason
            clearError(txtReason);
            if (txtReason.value.trim() === "") {
                showError(txtReason, "Please enter the reason for request.");
            }

            return isValid;
        }
    </script>
</asp:Content>