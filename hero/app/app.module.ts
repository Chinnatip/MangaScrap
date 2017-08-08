import { NgModule } from '@angular/core' ;
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';  //add form injector

import { AppComponent } from './app.component' ; // bind main component


@NgModule({
  imports: [
    BrowserModule,
    FormsModule
   ],
  declarations:  [ AppComponent ],
  bootstrap: [ AppComponent ]
})

export class AppModule {}
