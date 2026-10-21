<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeBehind="PokemonLista.aspx.cs" Inherits="pokedex_web.PokemonLista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1>Lista de Pokemons</h1>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <asp:Label Text="Filtrar" runat="server" />
                        <asp:TextBox runat="server" ID="txtFiltro" CssClass="form-control" AutoPostBack="true" OnTextChanged="filtro_TextChanged" />
                    </div>
                </div>
                <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
                    <div class="mb-3">
                        <asp:CheckBox   Text="Filtro Avanzado" 
                                        CssClass="" ID="chkAvanzado" runat="server" 
                                        AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged"/>
                    </div>
                </div>
            </div>
            <!-- 1era opcion si  se pierde el valor de la propiedad en la actualizacion del filtro-->
            <!--%if (chkAvanzado.Checked) 
                {  %-->
            <!-- if original-->
            <%if (FiltroAvanzado) 
            {  %>
            <div class="row">
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Campo" runat="server" />
                        <asp:DropDownList ID="ddlCampo" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                            <asp:ListItem Text="Nombre" />
                            <asp:ListItem Text="Tipo" />
                            <asp:ListItem Text="Número" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Criterio" runat="server" />
                        <asp:DropDownList ID="ddlCriterio" CssClass="form-control" runat="server">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Filtro" runat="server" />
                        <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Label Text="Estado" runat="server" />
                        <asp:DropDownList ID="ddlEstado" CssClass="form-control" runat="server">
                            <asp:ListItem Text="Todos" />
                            <asp:ListItem Text="Activo" />
                            <asp:ListItem Text="Inactivo" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-3">
                    <div class="mb-3">
                        <asp:Button Text="Buscar" ID="btnBuscar"  runat="server" CssClass="btn btn-primary"  OnClick="btnBuscar_Click" />
                    </div>
                </div>
            </div>
            <%} %>
            <asp:GridView ID="dgvPokemons" runat="server" DataKeyNames="Id"
                CssClass="table" AutoGenerateColumns="false" OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged"
                OnPageIndexChanging="dgvPokemons_PageIndexChanging"
                AllowPaging="true" PageSize="5">

                <Columns>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                    <asp:BoundField HeaderText="Número" DataField="Numero" />
                    <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
                    <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
                    <asp:CommandField HeaderText="Acción" ShowSelectButton="true" SelectText="✍️" />
                </Columns>

            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
