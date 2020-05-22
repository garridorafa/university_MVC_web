<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Materias.aspx.cs" Inherits="Inscripcion.Materias" %>

<asp:Content runat="server" ContentPlaceHolderID="Contenido">
    <br />
    
    <h1>Mantenimiento Materias</h1>

    <asp:Table runat="server">
        <asp:TableRow>
            <asp:TableCell>
                    Id
                    <br />
                <asp:TextBox runat="server" ID="txtIdMaterias" CssClass="form-control" Width="50" ReadOnly="true"></asp:TextBox>
                <asp:Label runat="server" ID="Msg"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                Descripcion<br />
                <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" Width="300"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

        <asp:TableRow>
            <asp:TableCell>
                Cantidad Credito<br /> <asp:TextBox runat="server" Width="100" ID="txtCantidadCredito" CssClass="form-control"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Valor Crédito<br /> <asp:TextBox runat="server" ID="txtValorCredito" CssClass="form-control" Width="100"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>

    </asp:Table>
    <br />
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
     
    <div style="float:left; width:100%">
        <asp:GridView runat="server" CssClass="table table-condensed" ID="gvMaterias" DataKeyNames="Id" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gvMaterias_RowCommand" OnPageIndexChanging="gvMaterias_PageIndexChanging" PageSize="3" AllowPaging="True">
            <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id"></asp:BoundField>
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion"></asp:BoundField>
                <asp:BoundField DataField="cantidadCreditos" HeaderText="Cantidad Cr&#233;ditos"></asp:BoundField>
                <asp:BoundField DataField="valorCreditos" HeaderText="Valor Cr&#233;dito"></asp:BoundField>
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
            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True"></FooterStyle>

            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <PagerStyle HorizontalAlign="Center" BackColor="#FFCC66" ForeColor="#333333"></PagerStyle>

            <RowStyle ForeColor="#333333" BackColor="#FFFBD6"></RowStyle>

            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#FDF5AC"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#4D0000"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#FCF6C0"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#820000"></SortedDescendingHeaderStyle>
        </asp:GridView>
    </div>

     
</asp:Content>