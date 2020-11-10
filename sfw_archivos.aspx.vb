Imports System.Data
Imports System.Data.SqlClient
Partial Class sfw_archivos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim reference As String = Request.QueryString("ref")            
            binddata(reference)
        End If
    End Sub

    Private Sub binddata(ByVal referencia As String)
        Dim oCC As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim lparam As New List(Of SqlParameter)
        Dim param As SqlParameter
        Dim sp As String

        sp = "Softway_Archivos_GetByReference"
        param = New SqlParameter("@referencecode", SqlDbType.NVarChar, 50)
        param.Value = referencia
        lparam.Add(param)

        param = New SqlParameter("@tipo", SqlDbType.NVarChar, 50)
        param.Value = "Recibido"
        lparam.Add(param)

        oCC.consultaSP(sp, lparam.ToArray, "recibidos")
        gvRecibidos.DataSource = oCC.oDS
        gvRecibidos.DataMember = "recibidos"
        gvRecibidos.DataBind()

        lparam.RemoveAt(1)
        param.Value = "Enviado"
        lparam.Add(param)

        oCC.consultaSP(sp, lparam.ToArray, "enviados")
        gvEnviados.DataSource = oCC.oDS
        gvEnviados.DataMember = "enviados"
        gvEnviados.DataBind()

    End Sub


    Public Sub getFileXML(ByVal id As String, ByVal fileName As String)
        Dim idFile As String = id
        Dim oCC As New clsConex(ConfigurationManager.ConnectionStrings("mySql").ToString)
        Dim sql As String
        Dim fileXml As String = ""
        sql = "select [xml] from Softway_Archivos where idfile=" & idFile
        fileXml = oCC.exSqlEsc(sql)

        If (fileXml <> "") Then



            ClientScript.RegisterClientScriptBlock(Me.Page.GetType, "resaltarFila", "function setMouseOverColor(element) {document.body.style.cursor='pointer';oldgridSelectedColor = element.style.backgroundColor;element.style.backgroundColor='white';}function setMouseOutColor(element) {document.body.style.cursor='default';element.style.backgroundColor=oldgridSelectedColor;element.style.textDecoration='none';}", True)
            Dim targetEncoding As Encoding

            targetEncoding = Encoding.GetEncoding(0)
            Dim algo As Byte() = targetEncoding.GetBytes(fileXml)
            Response.ContentType = "application/octet-stream"
            Response.AddHeader("Content-Disposition", "attachment;filename=" & fileName)
            Response.OutputStream.Write(algo, 0, algo.Length)
            Response.End()
            Response.Flush()
        Else

        End If

    End Sub

    Protected Sub gvEnviados_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvEnviados.RowCommand
        Dim fileName = gvEnviados.Rows(Convert.ToInt32(e.CommandArgument)).Cells(1).Text
        Dim id As String = gvEnviados.Rows(Convert.ToInt32(e.CommandArgument)).Cells(0).Text        
        getFileXML(id, fileName)

    End Sub


    
    Protected Sub gvEnviados_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvEnviados.SelectedIndexChanged

    End Sub
End Class
