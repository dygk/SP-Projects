<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewRFTrackerForm.ascx.cs" Inherits="SPProjects.WebParts.WebParts.TelerikDateControlsWebPart" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2020.3.915.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.Design" Assembly="Telerik.Web.Design, Version=2020.3.915.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>

<telerik:RadScriptBlock runat="server" ID="rsbRFTracker">

    <script type="text/javascript">

        function DateSelected(sender, e) {
            var id = sender.get_element().id.replace("_dateInput", "") + "_wrapper";
            var wrapper = $get(id);
            var vIndex = wrapper.getAttribute("ValidationIndex");
            var vIndexNum = parseInt(vIndex);
            var date = sender.get_selectedDate();


            if (date == null) {

                for (var i = vIndexNum; i > 0; i--) {

                    var rfvChildControl = $get($telerik.$("[RfvValidationIndex$='" + i + "']").get(0).id.replace("_wrapper", ""));
                    var rdtChildControl = $find($telerik.$("[ValidationIndex$='" + i + "']").get(0).id.replace("_wrapper", ""));

                    if ($telerik.$("[RfvValidationIndex$='" + (i + 1) + "']").length > 0) {


                        var rfvParentControl = $get($telerik.$("[RfvValidationIndex$='" + (i + 1) + "']").get(0).id.replace("_wrapper", ""));
                        var rdtParentControl = $find($telerik.$("[ValidationIndex$='" + (i + 1) + "']").get(0).id.replace("_wrapper", ""));

                        rfvChildControl.enabled = rfvParentControl.enabled || (rdtParentControl.get_selectedDate() != null);
                        rdtChildControl._element.parentElement.style.border = rfvChildControl.enabled && (rdtChildControl.get_selectedDate() == null) ? '2px solid #25a0da' : 'none';

                    } else {
                        rdtChildControl._element.parentElement.style.border = 'none';
                    }
                }



            } else {
                wrapper.style.border = 'none';

                for (var i = vIndexNum - 1; i > 0; i--) {
                    var rfvControl = $get($telerik.$("[RfvValidationIndex$='" + i + "']").get(0).id.replace("_wrapper", ""));
                    var rdtControl = $find($telerik.$("[ValidationIndex$='" + i + "']").get(0).id.replace("_wrapper", ""));
                    rfvControl.enabled = true;
                    rdtControl._element.parentElement.style.border = rdtControl.get_selectedDate() == null ? '2px solid #25a0da' : 'none';

                }


            }
        }


    </script>

</telerik:RadScriptBlock>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Metro">
</telerik:RadAjaxLoadingPanel>


<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">


    <div class="formRow" style="padding-right: 10px; padding-left: 10px;">
        <table>

            <tr>
                <td>
                    <label>Dispatch Date</label></td>
                <td>
                    <telerik:RadDatePicker ID="rdtDispatchedDate" runat="server" Skin="Metro" ValidationIndex="1" ClientEvents-OnDateSelected="DateSelected"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator RfvValidationIndex="1" ID="rfvDispatchedDate" runat="server" Enabled="false" ErrorMessage="Please select a Dispatch Date"
                        ValidationGroup="NewRF" ControlToValidate="rdtDispatchedDate" Display="None"></asp:RequiredFieldValidator>

                </td>
            </tr>

            <tr>
                <td>
                    <label>ATA Border Date</label></td>
                <td>
                    <telerik:RadDatePicker ID="rdtATABorderDate" runat="server" Skin="Metro" ValidationIndex="2" ClientEvents-OnDateSelected="DateSelected"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator RfvValidationIndex="2" ID="rfvATABorderDate" runat="server" Enabled="false" ErrorMessage="Please select an ATA Border Date"
                        ValidationGroup="NewRF" ControlToValidate="rdtATABorderDate" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>ATD Border Date</label></td>
                <td>
                    <telerik:RadDatePicker ID="rdtATDBorderDate" runat="server" Skin="Metro" ValidationIndex="3" ClientEvents-OnDateSelected="DateSelected"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator RfvValidationIndex="3" ID="rfvATDBorderDate" runat="server" Enabled="false" ErrorMessage="Please select an ATD Border Date"
                        ValidationGroup="NewRF" ControlToValidate="rdtATDBorderDate" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>ATA Consignee Date</label></td>
                <td>
                    <telerik:RadDatePicker ID="rdtATAConsigneeDate" runat="server" Skin="Metro" ValidationIndex="4" ClientEvents-OnDateSelected="DateSelected"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator RfvValidationIndex="4" ID="rfvATAConsigneeDate" runat="server" Enabled="false" ErrorMessage="Please select an ATA Consignee date"
                        ValidationGroup="NewRF" ControlToValidate="rdtATAConsigneeDate" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Offloading  Date</label></td>
                <td>
                    <telerik:RadDatePicker ID="rdtOffLoadingDate" runat="server" Skin="Metro" ValidationIndex="5" ClientEvents-OnDateSelected="DateSelected"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator RfvValidationIndex="5" ID="rfvOffLoadingDate" runat="server" Enabled="false" ErrorMessage="Please select an Off Loading Date"
                        ValidationGroup="NewRF" ControlToValidate="rdtOffLoadingDate" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <label>POD Received Date</label></td>
                <td>
                    <telerik:RadDatePicker ID="rdtPODReceivedDate" runat="server" Skin="Metro" ValidationIndex="6" ClientEvents-OnDateSelected="DateSelected"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator RfvValidationIndex="6" ID="rfvPODReceivedDate" runat="server" Enabled="false" ErrorMessage="Please select an Off Loading Date"
                        ValidationGroup="NewRF" ControlToValidate="rdtPODReceivedDate" Display="None"></asp:RequiredFieldValidator>
                </td>
            </tr>

        </table>
    </div>
    <table>

        <tr style="height: 30px;">
            <td style="width: 800px">
                <div id="divSummary">
                    <asp:ValidationSummary Visible="false" ID="vsNewRF" runat="server" ShowSummary="true" ForeColor="#25a0da" DisplayMode="BulletList" ValidationGroup="NewRF" />
                </div>

            </td>
        </tr>
    </table>


</telerik:RadAjaxPanel>
