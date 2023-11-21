import { Component } from '@angular/core';
import { Productos } from 'src/app/interfaces/productos';
import { CarritoService } from 'src/app/service/carrito.service';

@Component({
  selector: 'app-carrito',
  templateUrl: './carrito.component.html',
  styleUrls: ['./carrito.component.css']
})
export class CarritoComponent {
  ListaProductos: Productos[] = [];

  email = "l19141198@queretaro.tecnm.mx";

  constructor(
    private carritoService: CarritoService
  ){

  }
  ngOnInit(){
    this.carritoService.productos.subscribe(ListaProductos => {
      this.ListaProductos = ListaProductos;
      console.log(ListaProductos);
    });
  }

  totalProductos(precio: number, unidad: number){
    var total = precio*unidad;
    return total;
  }
  actualizarUnidad(operacion: string, id:string){
    const producto = this.carritoService.buscarProducto(id)
    if(producto){
      if(operacion == 'menos' && producto.cantidad>0){
        producto.cantidad = producto.cantidad - 1;
      }
      if(operacion == 'sumar'){
        producto.cantidad = producto.cantidad + 1;
      }
      if(producto.cantidad == 0){
      this.quitarProducto(id);
      }
    }
  }
  quitarProducto(id: string){
    this.carritoService.borrarProducto(id)
  }
  onClickComprar(comida: Productos){
    comida.email = this.email
    
    this.carritoService.comprarCarrito(comida).subscribe(data =>{
      alert(data);
      console.log(comida);
    })
  }

}
