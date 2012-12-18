<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectBelle.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>OpenText Analytics Login</title>

    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="/js/jquery-1.7.2.min.js"></script>
    <script src="/js/bootstrap.js"></script>

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <!--[if IE 7]>
      <link rel="stylesheet" href="/css/font-awesome-ie7.css">
    <![endif]-->
</head>
<body>

    <div class="main">
        <div class="container">
            <div style="text-align: center">
                <div id="login">
                    <h1>OpenText Analytics Login</h1>
                    <div class="alert alert-error hide" id="divMessage"><asp:Label runat="server" ID="lblMessage" /></div>
                    <p>Sign in below:</p>

                    <form id="Form1" method="post" runat="server">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-envelope"></i></span>
                            <asp:TextBox runat="server" class="span3" name="txtEmail" ID="txtEmail" placeholder="E-mail Address" />
                        </div>

                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-lock icon-large"></i></span>
                            <asp:TextBox runat="server" class="span3" name="txtPassword" ID="txtPassword" type="password" placeholder="Password" TextMode="Password" />
                        </div>

                        <div class="submit">
                            <input type="submit" class="btn btn-primary" value="Log In" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- /main -->

    <script>
        $(document).ready(function () {
            console.log("val!" + $('#lblMessage').text());
            if ($('#lblMessage').text().length > 0) {
                console.log("length > 0!" + $('#lblMessage').text());
                $('#divMessage').removeClass("hide");
            }
        });
    </script>

</body>
</html>
