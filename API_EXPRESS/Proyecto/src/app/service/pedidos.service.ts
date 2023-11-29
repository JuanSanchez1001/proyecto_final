import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Pedidos } from '../interfaces/pedidos';

@Injectable({
  providedIn: 'root'
})
export class PedidosService {

  BASE_URL = 'http://localhost:3000'
  constructor(
    private httpClient: HttpClient
  ) { }
  
  getAllPedidos(): Observable<Pedidos[]>{
    const response = this.httpClient.get<Pedidos[]>(this.BASE_URL+'/pedidos')
    return response
  }
  getPedidoID(id: string){
    
  }
}
