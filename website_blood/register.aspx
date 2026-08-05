<%@ Page Title="Register - BloodConnect" Language="C#" MasterPageFile="~/blood.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="website_blood.register" %>

<%-- 1. HEAD CONTENT PLACEHOLDER --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.4/font/bootstrap-icons.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/style.css" />
    <style>
        .input-group.is-invalid .input-group-text,
        .input-group.is-invalid .form-control {
            border-color: #dc3545 !important;
        }
        .input-group.is-valid .input-group-text,
        .input-group.is-valid .form-control {
            border-color: #198754 !important;
        }
        .field-error-msg {
            display: none;
            color: #dc3545;
            font-size: 0.85rem;
            margin-top: 0.25rem;
            font-weight: 500;
        }
    </style>
</asp:Content>

<%-- 2. NAVBAR / HEADER PLACEHOLDER --%>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="sticky-top shadow-sm bg-white">
        <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
            <div class="container">
                <asp:HyperLink ID="lnkBrand" runat="server" NavigateUrl="~/index.aspx" CssClass="navbar-brand fw-bold text-danger fs-4">BloodConnect</asp:HyperLink>
                
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

                        <% if (Session["UserEmail"] == null) { %>
                            <li class="nav-item">
                                <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/login.aspx" CssClass="btn btn-outline-danger btn-sm ms-lg-3">Login</asp:HyperLink>
                            </li>
                            <li class="nav-item">
                                <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/register.aspx" CssClass="btn btn-danger btn-sm ms-2 active">Register</asp:HyperLink>
                            </li>
                        <% } else { %>
                            <li class="nav-item">
                                <asp:HyperLink ID="lnkProfile" runat="server" NavigateUrl="~/userpanel.aspx" CssClass="btn btn-soft-danger btn-sm ms-lg-3 text-danger fw-bold">
                                    <i class="bi bi-person-circle me-1"></i> My Profile
                                </asp:HyperLink>
                            </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
</asp:Content>

<%-- 3. MAIN REGISTER FORM CONTENT PLACEHOLDER --%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main class="bg-light py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10">
                    <!-- Form Header Banner -->
                    <div class="text-center mb-4">
                        <span class="badge bg-danger bg-opacity-10 text-danger px-3 py-2 rounded-pill fw-semibold mb-2">Join Our Network</span>
                        <h2 class="fw-bold text-dark">Create Your Account</h2>
                        <p class="text-muted">Register to coordinate blood requests, maintain donor profiles, and access services.</p>
                    </div>

                    <!-- Main Form Card -->
                    <div class="card rounded-4 shadow-sm border-0">
                        <div class="card-body p-4 p-md-5">

                            <!-- Registration Form Grid -->
                            <div class="row g-3" id="registerForm">
                                <!-- Full Name -->
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold text-muted small mb-1">Full Name <span class="text-danger">*</span></label>
                                    <div class="input-group" id="groupFullName">
                                        <span class="input-group-text bg-light text-muted border-end-0"><i class="bi bi-person"></i></span>
                                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control border-start-0" Placeholder="John Doe"></asp:TextBox>
                                    </div>
                                    <span class="field-error-msg" id="errFullName">Please enter your full name.</span>
                                </div>

                                <!-- Phone Number -->
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold text-muted small mb-1">Phone Number <span class="text-danger">*</span></label>
                                    <div class="input-group" id="groupPhone">
                                        <span class="input-group-text bg-light text-muted border-end-0"><i class="bi bi-telephone"></i></span>
                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control border-start-0" TextMode="Phone" Placeholder="9876543210"></asp:TextBox>
                                    </div>
                                    <span class="field-error-msg" id="errPhone">Please enter a valid 10-digit phone number.</span>
                                </div>

                                <!-- Email Address -->
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold text-muted small mb-1">Email Address <span class="text-danger">*</span></label>
                                    <div class="input-group" id="groupEmail">
                                        <span class="input-group-text bg-light text-muted border-end-0"><i class="bi bi-envelope"></i></span>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control border-start-0" TextMode="Email" Placeholder="name@example.com"></asp:TextBox>
                                    </div>
                                    <span class="field-error-msg" id="errEmail">Please enter a valid email address.</span>
                                </div>

                                <!-- Password -->
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold text-muted small mb-1">Password <span class="text-danger">*</span></label>
                                    <div class="input-group" id="groupPassword">
                                        <span class="input-group-text bg-light text-muted border-end-0"><i class="bi bi-lock"></i></span>
                                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control border-start-0" TextMode="Password" Placeholder="••••••••"></asp:TextBox>
                                    </div>
                                    <span class="field-error-msg" id="errPassword">Password must be at least 6 characters long.</span>
                                </div>

                                <!-- City -->
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold text-muted small mb-1">City <span class="text-danger">*</span></label>
                                    <div class="input-group" id="groupCity">
                                        <span class="input-group-text bg-light text-muted border-end-0"><i class="bi bi-geo-alt"></i></span>
                                        <asp:TextBox ID="txtCity" runat="server" CssClass="form-control border-start-0" Placeholder="e.g. Rajkot"></asp:TextBox>
                                    </div>
                                    <span class="field-error-msg" id="errCity">Please enter your city.</span>
                                </div>

                                <!-- Hospital / Organization -->
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold text-muted small mb-1">Hospital / Organization <span class="text-muted fw-normal">(Optional)</span></label>
                                    <div class="input-group" id="groupOrganization">
                                        <span class="input-group-text bg-light text-muted border-end-0"><i class="bi bi-building"></i></span>
                                        <asp:TextBox ID="txtOrganization" runat="server" CssClass="form-control border-start-0" Placeholder="e.g. Civil Hospital"></asp:TextBox>
                                    </div>
                                </div>

                                <!-- Status / Alert Output -->
                                <div class="col-12 mt-3">
                                    <asp:Label ID="lblOutput" runat="server" Visible="false" CssClass="alert alert-info w-100 d-block mb-0" role="alert"></asp:Label>
                                </div>

                                <!-- Submit Button -->
                                <div class="col-12 mt-4">
                                    <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="btn btn-danger btn-lg w-100 fw-bold shadow-sm py-3" OnClientClick="return validateRegisterForm();" OnClick="btnRegister_Click" />
                                </div>
                            </div>

                            <!-- Login Alternative Link -->
                            <div class="text-center mt-4">
                                <p class="text-muted small mb-0">Already have a BloodConnect account? 
                                    <asp:HyperLink ID="lnkToLogin" runat="server" NavigateUrl="~/login.aspx" CssClass="text-danger fw-bold text-decoration-none">Log in here</asp:HyperLink>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

<%-- 4. FOOTER PLACEHOLDER --%>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <footer class="footer bg-white py-5 border-top">
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-4">
                    <h5 class="text-danger fw-bold">BloodConnect</h5>
                    <p class="text-muted small">A reliable portal for emergency blood availability, hospital coordination, and donor support with a modern, accessible experience.</p>
                    <div class="d-flex gap-3">
                        <a href="#" class="text-muted fs-5"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="text-muted fs-5"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="text-muted fs-5"><i class="bi bi-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-2">
                    <h6 class="fw-bold">Quick Links</h6>
                    <ul class="list-unstyled small">
                        <li class="mb-2"><asp:HyperLink ID="lnkFooterHome" runat="server" NavigateUrl="~/index.aspx" CssClass="text-decoration-none text-muted">Home</asp:HyperLink></li>
                        <li class="mb-2"><asp:HyperLink ID="lnkFooterHospitals" runat="server" NavigateUrl="~/hospitals.aspx" CssClass="text-decoration-none text-muted">Hospitals</asp:HyperLink></li>
                        <li class="mb-2"><asp:HyperLink ID="lnkFooterAbout" runat="server" NavigateUrl="~/about.aspx" CssClass="text-decoration-none text-muted">About</asp:HyperLink></li>
                        <li class="mb-2"><asp:HyperLink ID="lnkFooterContact" runat="server" NavigateUrl="~/contact.aspx" CssClass="text-decoration-none text-muted">Contact</asp:HyperLink></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h6 class="fw-bold">Emergency Contacts</h6>
                    <p class="mb-1 small text-muted"><i class="bi bi-telephone-fill me-2 text-danger"></i>National Helpline: 112</p>
                    <p class="mb-1 small text-muted"><i class="bi bi-envelope-fill me-2 text-danger"></i>support@bloodconnect.org</p>
                    <p class="mb-0 small text-muted"><i class="bi bi-geo-alt-fill me-2 text-danger"></i>Gujarat, India</p>
                </div>
                <div class="col-lg-3">
                    <h6 class="fw-bold">Need Assistance</h6>
                    <p class="mb-1 text-muted small">Contact our help desk for hospital coordination and donor scheduling.</p>
                    <p class="mb-0 fw-semibold text-danger">Help Desk: +91 99887 66554</p>
                </div>
            </div>
            <div class="text-center mt-4 text-muted small">&copy; 2026 BloodConnect. All rights reserved.</div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>

    <!-- JS FORM VALIDATION -->
    <script>
        function validateRegisterForm() {
            let isValid = true;

            // Input Fields
            const txtFullName = document.getElementById('<%= txtFullName.ClientID %>');
            const txtPhone = document.getElementById('<%= txtPhone.ClientID %>');
            const txtEmail = document.getElementById('<%= txtEmail.ClientID %>');
            const txtPassword = document.getElementById('<%= txtPassword.ClientID %>');
            const txtCity = document.getElementById('<%= txtCity.ClientID %>');

            // Input Groups (for border styling)
            const groupFullName = document.getElementById('groupFullName');
            const groupPhone = document.getElementById('groupPhone');
            const groupEmail = document.getElementById('groupEmail');
            const groupPassword = document.getElementById('groupPassword');
            const groupCity = document.getElementById('groupCity');

            // Error Labels
            const errFullName = document.getElementById('errFullName');
            const errPhone = document.getElementById('errPhone');
            const errEmail = document.getElementById('errEmail');
            const errPassword = document.getElementById('errPassword');
            const errCity = document.getElementById('errCity');

            // Reset Function
            function resetField(group, err) {
                group.classList.remove('is-invalid', 'is-valid');
                if (err) err.style.display = 'none';
            }

            // Set Error Function
            function setError(group, err, msg) {
                group.classList.add('is-invalid');
                group.classList.remove('is-valid');
                if (err) {
                    if (msg) err.innerText = msg;
                    err.style.display = 'block';
                }
                isValid = false;
            }

            // Set Valid Function
            function setValid(group, err) {
                group.classList.remove('is-invalid');
                group.classList.add('is-valid');
                if (err) err.style.display = 'none';
            }

            // 1. Validate Full Name
            if (txtFullName.value.trim() === '') {
                setError(groupFullName, errFullName, 'Please enter your full name.');
            } else {
                setValid(groupFullName, errFullName);
            }

            // 2. Validate Phone Number (10 digits)
            const phoneRegex = /^[0-9]{10}$/;
            const cleanPhone = txtPhone.value.trim().replace(/[\s\-\+]/g, '');
            if (cleanPhone === '') {
                setError(groupPhone, errPhone, 'Please enter your phone number.');
            } else if (!phoneRegex.test(cleanPhone)) {
                setError(groupPhone, errPhone, 'Please enter a valid 10-digit phone number.');
            } else {
                setValid(groupPhone, errPhone);
            }

            // 3. Validate Email Address
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (txtEmail.value.trim() === '') {
                setError(groupEmail, errEmail, 'Please enter your email address.');
            } else if (!emailRegex.test(txtEmail.value.trim())) {
                setError(groupEmail, errEmail, 'Please enter a valid email address.');
            } else {
                setValid(groupEmail, errEmail);
            }

            // 4. Validate Password
            if (txtPassword.value.trim() === '') {
                setError(groupPassword, errPassword, 'Please enter a password.');
            } else if (txtPassword.value.length < 6) {
                setError(groupPassword, errPassword, 'Password must be at least 6 characters long.');
            } else {
                setValid(groupPassword, errPassword);
            }

            // 5. Validate City
            if (txtCity.value.trim() === '') {
                setError(groupCity, errCity, 'Please enter your city.');
            } else {
                setValid(groupCity, errCity);
            }

            return isValid;
        }

        // Live Validation Clear on Typing
        document.addEventListener('DOMContentLoaded', function () {
            const inputs = [
                { id: '<%= txtFullName.ClientID %>', group: 'groupFullName', err: 'errFullName' },
                { id: '<%= txtPhone.ClientID %>', group: 'groupPhone', err: 'errPhone' },
                { id: '<%= txtEmail.ClientID %>', group: 'groupEmail', err: 'errEmail' },
                { id: '<%= txtPassword.ClientID %>', group: 'groupPassword', err: 'errPassword' },
                { id: '<%= txtCity.ClientID %>', group: 'groupCity', err: 'errCity' }
            ];

            inputs.forEach(function(item) {
                const el = document.getElementById(item.id);
                if (el) {
                    el.addEventListener('input', function() {
                        const group = document.getElementById(item.group);
                        const err = document.getElementById(item.err);
                        if (group) group.classList.remove('is-invalid');
                        if (err) err.style.display = 'none';
                    });
                }
            });
        });
    </script>
</asp:Content>