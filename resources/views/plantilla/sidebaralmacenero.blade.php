<div class="navbar-custom">
                <div class="container-fluid">
                    <div id="navigation">
                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">
                            <li @click="menu=0" class="has-submenu">
                                <a href="#"><i class="mdi mdi-desktop-mac"></i> <span> Escritorio </span> </a>
                            </li>
                            <li class="has-submenu">
                                <a href="#"><i class="mdi mdi-briefcase"></i> <span> Almacen </span> </a>
                                <ul class="submenu megamenu">
                                    <li @click="menu=1">
                                        <a href="javascript:void(0);"><i class="mdi mdi-clipboard"></i> Categorias </a>
                                    </li>
                                    <li @click="menu=2">
                                        <a href="javascript:void(0);"><i class="mdi mdi-clipboard"></i> Productos </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="has-submenu">
                                <a href="#"><i class="mdi mdi-cash-multiple"></i> Compras </a>
                                <ul class="submenu">
                                    <li @click="menu=3">
                                        <a href="#"><i class="mdi mdi-currency-usd"></i> Ingresos </a>
                                    </li>
                                    <li @click="menu=4">
                                        <a href="#"><i class="mdi  mdi-truck"></i> Proveedores </a>
                                    </li>
                                </ul>
                            </li>

 

                            <li class="has-submenu">
                                <a href="#"><i class="mdi mdi-chart-pie"></i><span> Reportes </span> </a>
                                <ul class="submenu">
                                    <li @click="menu=9">
                                        <a href="#"><i class="mdi mdi-chart-bar"></i> Reporte de Ingresos </a>
                                    </li>
                                    
                                </ul>
                            </li>

                            <li @click="menu=11" class="has-submenu">
                                <a href="#"><i class="mdi mdi-help-circle"></i><span> Ayuda </span> </a>
                            </li>
                            <li @click="menu=12" class="has-submenu">
                                <a href="#"><i class="mdi mdi-information"></i><span> Aderca de </span> </a>
                            </li>
                        </ul>
                        <!-- End navigation menu -->
                    </div> <!-- end #navigation -->
                </div> <!-- end container -->
            </div> <!-- end navbar-custom -->