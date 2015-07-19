using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text;

namespace GateAccess.Models.Helper
{
    public static class CustomHtmlHelpers
    {
        public static MvcHtmlString CheckBoxListFor(this HtmlHelper helper, String name, IEnumerable<SelectListItem> items)
        {
            //Build a string builder
            var output = new StringBuilder();
            output.Append("<div>");
            output.Append("<table>");
            int itemCount = 0;

            //Loop through items and generate checkbox list.
            foreach (var item in items)
            {
                itemCount++;
                output.Append("<tr><td style='white-space:normal;'>");
                var checkboxList = new TagBuilder("input");
                checkboxList.MergeAttribute("type", "checkbox");
                checkboxList.MergeAttribute("name", name, true);
                checkboxList.MergeAttribute("ID", name + "-" + item.Value, true);
                checkboxList.MergeAttribute("value", item.Value);

                //if (!ReferenceEquals(htmlAttributes, null))
                //    checkboxList.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes));

                // Check to see if it's checked                   
                if (item.Selected)
                    checkboxList.MergeAttribute("checked", "checked");

                checkboxList.SetInnerText(item.Text);
                output.Append(checkboxList.ToString(TagRenderMode.SelfClosing));
                output.Append("&nbsp;");
                output.Append(item.Text);

                //List alignment as per number of columns specified
                // if ((itemCount % columns) == 0)
                //{
                output.Append("</td>");
                output.Append("</tr>");
                //    output.Append("<tr>");
                //}
                //else
                //{
                //    output.Append("</td>");
                //}
            }
            output.Append("</tr></table>");
            output.Append("</div>");

            return MvcHtmlString.Create(output.ToString());
        }


        //public static MvcHtmlString RadioButtonsListFor(this HtmlHelper helper, String name, IEnumerable<SelectListItem> items, object htmlAttributes)
        //{
        //    //Build a string builder
        //    var output = new StringBuilder();
        //    output.Append("<div>");
        //    output.Append("<table>");
        //    int itemCount = 0;

        //    //Loop through items and generate checkbox list.
        //    foreach (var item in items)
        //    {
        //        itemCount++;
        //        output.Append("<tr><td style='white-space:normal;'>");
        //        var radiobuttonsList = new TagBuilder("input");
        //        radiobuttonsList.MergeAttribute("type", "radio");
        //        radiobuttonsList.MergeAttribute("name", name, true);
        //        radiobuttonsList.MergeAttribute("ID", name + "-" + item.Value, true);
        //        radiobuttonsList.MergeAttribute("value", item.Value);

        //        if (!ReferenceEquals(htmlAttributes, null))
        //            radiobuttonsList.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes));

        //        // Check to see if it's checked                   
        //        if (item.Selected)
        //            radiobuttonsList.MergeAttribute("checked", "checked");

        //        radiobuttonsList.SetInnerText(item.Text);
        //        output.Append(radiobuttonsList.ToString(TagRenderMode.SelfClosing));
        //        output.Append("&nbsp;");
        //        output.Append(item.Text);

        //        //List alignment as per number of columns specified
        //        // if ((itemCount % columns) == 0)
        //        //{
        //        output.Append("</td>");
        //        output.Append("</tr>");
        //        //    output.Append("<tr>");
        //        //}
        //        //else
        //        //{
        //        //    output.Append("</td>");
        //        //}
        //    }
        //    output.Append("</tr></table>");
        //    output.Append("</div>");

        //    return MvcHtmlString.Create(output.ToString());
        //}
    }
}