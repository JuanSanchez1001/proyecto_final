import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductosComponent } from './components/productos/productos.component';
import { CarritoComponent } from './components/carrito/carrito.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { AdministradorComponent } from './components/administrador/administrador.component';
import { LoginGuard } from './guards/login.guard';
import { RoleGuard } from './guards/rol.guard';
import { LoginComponent } from './components/login/login.component';
import { CorreoComponent } from './components/correo/correo.component';


const routes: Routes = [
  { path: 'admin', component: AdministradorComponent, canActivate: [LoginGuard, RoleGuard] },
  { path: 'home', component: ProductosComponent, canActivate:[LoginGuard] },
  { path: '', component: LoginComponent },
  {path: '**',redirectTo:''}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
