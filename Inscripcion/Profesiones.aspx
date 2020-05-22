<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profesiones.aspx.cs" Inherits="Inscripcion.Profesiones" %>

 <asp:Content runat="server" ContentPlaceHolderID="Contenido">
    <h3>Mantenimiento Profesiones </h3>
    Id<br />
    <asp:TextBox runat="server" CssClass="form-control" ID="txtId" Width="50"> </asp:TextBox>
    Descripción<br />
    <asp:TextBox runat="server" CssClass="form-control" ID="txtDescripcion" Width="400"></asp:TextBox>
    <div style="float:left">
        <asp:Table runat="server">
        <asp:TableFooterRow>
            <asp:TableCell>
                Buscar:
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtBuscar"  Width="100px"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button runat="server" ID="btnBuscar" Text="Buscar..." OnClick="btnBuscar_Click" CssClass="btn btn-primary" />
            </asp:TableCell>
        </asp:TableFooterRow>
    </asp:Table>
</div>
    <div style="float:right;width:55%">
        <asp:Button runat="server" Text="Guardar" ID="btnGuardar" CssClass="btn btn-success"  OnClick="btnGuardar_Click" />
        <asp:Button runat="server" Text="Cancelar" ID="btnCancelar" CssClass="btn btn-danger" />
    </div>
    <br />
   <div style="width:100%;float:left">
        <asp:GridView runat="server" Width="100%" DataKeyNames="Id"  OnPageIndexChanging="gvProfesiones_PageIndexChanging" OnRowCommand="gvProfesiones_RowCommand" ID="gvProfesiones" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5" AllowPaging="True" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>

        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id"></asp:BoundField>
            <asp:BoundField DataField="descripcion" HtmlEncode="false" HeaderText="Descripci&#243;n"></asp:BoundField>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="67px" ControlStyle-ForeColor="White">
                         <ItemTemplate>
                             <asp:LinkButton runat="server" CommandName="btnEditar" CssClass="btn btn-info" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">
                                            <i class="glyphicon glyphicon-edit" aria-hidden="true"></i>Editar
                            </asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>

                     <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="70px" ControlStyle-ForeColor="White">
                         <ItemTemplate>
                             <asp:LinkButton runat="server" CommandName="btnEliminar" CssClass="btn btn-danger" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" OnClientClick="return confirm('Estas seguro que deseas borrar este registro ?')">
                                            <i class="glyphicon glyphicon-remove" aria-hidden="true"></i>Eliminar
                            </asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
        </Columns>

        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

        <RowStyle BackColor="#FFFBD6" ForeColor="#333333"></RowStyle>

        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
    </asp:GridView>
   </div>

</asp:Content>
