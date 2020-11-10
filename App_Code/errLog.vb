Imports System.Text
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Configuration

Public Class errLog

    Private Shared Sub LogMessage(ByVal message As String)

        If (message Is Nothing) Then
            message = String.Empty
        End If

        message = _
         Environment.NewLine & _
         DateTime.Now.ToString() & _
         Environment.NewLine & _
         message & _
         Environment.NewLine
        Using myArchi As New StreamWriter(ConfigurationManager.AppSettings("archLog").ToString(), True)
            myArchi.WriteLine(message)
        End Using


    End Sub

    Public Shared Sub LogSqlErrors(ByVal message As String, ByVal errors As SqlErrorCollection)

        Dim builder As New StringBuilder()
        builder.Append(message)

        For Each err As SqlError In errors

            builder.Append(Environment.NewLine)
            builder.Append("   Procedure: ")
            builder.Append(err.Procedure)

            builder.Append(Environment.NewLine)
            builder.Append("   Line number: ")
            builder.Append(err.LineNumber)

            builder.Append(Environment.NewLine)
            builder.Append("   Severity level: ")
            builder.Append(err.Class)

            builder.Append(Environment.NewLine)
            builder.Append("   Message: ")
            builder.Append(err.Message)

            builder.Append(Environment.NewLine)
            builder.Append("   Server: ")
            builder.Append(err.Server)

            builder.Append(Environment.NewLine)
            builder.Append("   State: ")
            builder.Append(err.State)
        Next

        LogMessage(builder.ToString())

    End Sub

    Public Shared Sub LogException(ByVal ex As Exception)

        Try

            If TypeOf ex Is SqlException Then

                Dim sqlEx As SqlException = CType(ex, SqlException)
                Dim builder As New StringBuilder()
                
                builder.Append(Environment.NewLine)
                builder.Append("   Severity: ")
                builder.Append(sqlEx.Class)

                builder.Append(Environment.NewLine)
                builder.Append("   Message: ")
                builder.Append(sqlEx.Message)

                LogMessage(builder.ToString())

                LogSqlErrors("SqlErrors: ", sqlEx.Errors)

            Else

                LogMessage(Environment.NewLine & ex.ToString())

            End If

        Catch

            ' Exceptions thrown during exception logging are suppressed
            ' since they cannot be logged.
        End Try


    End Sub
End Class


