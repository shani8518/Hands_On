using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    string gender = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        calBod.Visible = false;
        calJoiningDate.Visible = false;
    }

    protected void imgBod_Click(object sender, ImageClickEventArgs e)
    {
        calBod.Visible = true;
    }

    protected void calBod_SelectionChanged(object sender, EventArgs e)
    {
        txtBod.Text = calBod.SelectedDate.ToShortDateString();
        calBod.Visible = false;
    }

    protected void imgJoiningDate_Click(object sender, ImageClickEventArgs e)
    {
        calJoiningDate.Visible = true;
    }

    protected void calJoiningDate_SelectionChanged(object sender, EventArgs e)
    {
        txtJoiningDate.Text = calJoiningDate.SelectedDate.ToShortDateString();
        calJoiningDate.Visible = false;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (rdMale.Checked)
            {
                gender = "Male";
            }
            else
            {
                gender = "Female";
            }
            string query = "insert into Employee(Emp_Code, Name, Department, Gender, BOD, JoiningDate, PreExp, Salary, Address) values(@Emp_Code, @Name, @Department, @Gender, @BOD, @JoiningDate, @PreExp, @Salary, @Address)";
            SqlCommand cmd = new SqlCommand(query, cnn);
            cmd.Parameters.AddWithValue("@Emp_Code", txtEmpCode.Text);
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Department", ddlDept.SelectedValue);
            cmd.Parameters.AddWithValue("@Gender", gender);
            cmd.Parameters.AddWithValue("@BOD", txtBod.Text);
            cmd.Parameters.AddWithValue("@JoiningDate", txtJoiningDate.Text);
            cmd.Parameters.AddWithValue("@PreExp", txtExp.Text);
            cmd.Parameters.AddWithValue("@Salary", txtSal.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            GridView1.Visible = true;
            cnn.Open();
            cmd.ExecuteNonQuery();
            cnn.Close();

        txtEmpCode.Text = "";
            txtName.Text = "";
            ddlDept.Text = "";
            gender = "";
            txtBod.Text = "";
            txtJoiningDate.Text = "";
            txtExp.Text = "";
            txtSal.Text = "";
            txtAddress.Text = "";
    }

    protected void btnCalcel_Click(object sender, EventArgs e)
    {
        txtEmpCode.Text = "";
        txtName.Text = "";
        ddlDept.Text = "";
        gender = "";
        txtBod.Text = "";
        txtJoiningDate.Text = "";
        txtExp.Text = "";
        txtSal.Text = "";
        txtAddress.Text = "";
    }
}