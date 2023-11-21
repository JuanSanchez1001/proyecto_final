import { Injectable } from '@angular/core';
import { Productos } from '../interfaces/productos';
import { BehaviorSubject, Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CarritoService {
  private listaProductos: Productos[] = [];

  BASE_URL = 'http://localhost:3000';

  private _productos: BehaviorSubject<Productos[]>;
  
  constructor(private httpClient: HttpClient) { 
    this._productos = new BehaviorSubject<Productos[]>([]);
  }

  get productos(){
    return this._productos.asObservable();
  }

  agregarCarrito(producto: Productos){
    //Funciones para botones de mas y menos
    if(this.listaProductos.length == 0){
      producto.cantidad = 1
      this.listaProductos.push(producto);
      this._productos.next(this.listaProductos);
    }else{
      const productMod = this.listaProductos.find((element) =>{
        return element.id_producto == producto.id_producto
      })
      if(productMod){
        productMod.cantidad = productMod.cantidad + 1;
        this._productos.next(this.listaProductos);
      }else{
        producto.cantidad = 1;
        this.listaProductos.push(producto)
        this._productos.next(this.listaProductos);
      }
    }
  }
  buscarProducto(id:string){
    return this.listaProductos.find((element)=>{
      return element.id_producto === id
    })
  }
  borrarProducto(id: string){
    this.listaProductos = this.listaProductos.filter((producto)=>{
      return producto.id_producto != id;
    })
    this._productos.next(this.listaProductos);
  }

  
  comprarCarrito(carrito: Productos){
    
    return this.httpClient.post<string>(this.BASE_URL + '/carrito/comprar', carrito)
    
  }
}