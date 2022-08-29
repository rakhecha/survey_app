
<div class="app-content content container-fluid">
<div class="content-wrapper">
   <div class="content-header row">
   </div>
   <div class="content-body">
      <section class="flexbox-container">
         <div class="col-md-4 offset-md-4 col-xs-10 offset-xs-1  box-shadow-2 p-0">
            <div class="card border-grey border-lighten-3 m-0">
               <div class="card-header no-border">
                  <div class="card-title text-xs-center">
                     <h1 class="">CMS</h1>
                  </div>
                  <h6 class="card-subtitle line-on-side text-muted text-xs-center font-small-3 pt-2"><span>Login with CMS</span></h6>
               </div>
               <div class="card-body collapse in">
                 <% if flash[:notice] %>
                 <div class="alert alert-danger" role="alert">
                 
                 <%= content_tag :span, flash[:notice] %>
                 </div>
                 <% end %>
                  <div class="card-block">
                  <%= form_with url: login_path, method: :post do |f| %>
                        <fieldset class="form-group position-relative has-icon-left mb-0">
                           <%= f.text_field :email, class: 'form-control form-control form-control-lg input-lg', placeholder: 'Your Email' %>
                           <div class="form-control-position">
                              <i class="icon-head"></i>
                           </div>
                        </fieldset>
                        <fieldset class="form-group position-relative has-icon-left">
                            <%= f.password_field :password, class: 'form-control form-control form-control-lg input-lg' , placeholder: 'Enter Password' %>
                            
                           <div class="form-control-position">
                              <i class="icon-key3"></i>
                           </div>
                        </fieldset>
                        <%= f.submit "Login", class: "btn btn-primary btn-lg btn-block" %>
                        
                        <% end %>
                  </div>
               </div>
            </div>
         </div>
      </section>
   </div>
</div>
</div>