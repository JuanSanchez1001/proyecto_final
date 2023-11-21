import { Component, OnInit } from '@angular/core';
import { Productos } from 'src/app/interfaces/productos';
import { CarritoService } from 'src/app/service/carrito.service';
import { ProductosService } from 'src/app/service/productos.service';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent implements OnInit{

  ListaProductos: Productos[] = [];

  constructor(
    private productosService: ProductosService,
    private carritoService: CarritoService
    ){

  }

  ngOnInit(): void {
    this.productosService.getAllProducts().subscribe((data) => {
      this.ListaProductos = data;
    })  
  }

  onClick(ListaProductos: Productos){
    this.carritoService.agregarCarrito(ListaProductos);
    console.log("Se ha agregado");
  }

}
