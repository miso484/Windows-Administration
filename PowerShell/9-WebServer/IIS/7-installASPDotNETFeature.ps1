# install ASP.NET 4.7
# if also install ASP.NET 3.5, specify [Web-Asp-Net] with comma separated
Install-WindowsFeature Web-Asp-Net45 


# create a test page to verify (example below is with C#)
$str_document = @'
<%@ Page Language="C#" %>
<script runat="server">
    private void Page_Load() {
        Msg.Text = "Hello ASP.NET World!";
    }
</script>
<html>
<body>
    <asp:Label runat="server" id="Msg" />
</body>
</html>
'@

# redirect contents to a page
$str_document > C:\inetpub\newsite\index.aspx

# verify accesses
curl.exe rx-7.srv.world/index.aspx 