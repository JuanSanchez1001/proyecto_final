import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CarritoService } from 'src/app/service/carrito.service';


@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent {
  viewCart: boolean = false;
  myCart$ = this.carritoService.agregarCarrito;

  constructor(
    private carritoService:CarritoService,
    private router: Router
    ){}

  clickShowCarrito(){
    this.viewCart = !this.viewCart
  }
  closeSession(){
    this.router.navigate(['login'])
  }
}
