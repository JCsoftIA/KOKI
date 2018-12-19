<div class="navbar-custom">
                <div class="container-fluid">
                    <div id="navigation">
                        <!-- Navigation Menu-->
                        <ul class="navigation-menu">
                            <li @click="menu=0" class="has-submenu">
                                <a href="#"><i class="mdi mdi-desktop-mac"></i> <span> Escritorio </span> </a>
                            </li>

                            <li class="has-submenu">
                                <a href="#"><i class="mdi mdi-cart"></i> <span> Ventas </span> </a>
                                <ul class="submenu">
                                    <li @click="menu=5">
                                        <a href="#"><i class="mdi mdi-cart-outline"></i> Ventas </a>
                                    </li>
                                    
                                </ul>
                            </li>

                            <li class="has-submenu">
                                <a href="#"><i class="mdi mdi-chart-pie"></i><span> Reportes </span> </a>
                                <ul class="submenu">
                                    <li @click="menu=10">
                                        <a href="#"><i class="mdi  mdi-chart-histogram"></i> Reporte de Ventas </a>
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