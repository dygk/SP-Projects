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
