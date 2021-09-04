# Este script me lo encargaron para mi clase de programacion para ciberseguridad, espero no haya problema si lo reutilizo aqui para su clase


Function showmenu {
    Clear-Host
    Write-Host "Starting Menu..."
    Write-Host "1. Ver el estatus de un perfil especi­fico en el Firewall"
    Write-Host "2. Cambiar el estatus de los perfiles"
    Write-Host "3. Ver el perfil de nuestra red"
    Write-Host "4. Cambiar nuestra red a otro tipo de perfil"
    Write-Host "5. Ver las reglas de bloqueo"
    Write-Host "6. Agregar regla de bloqueo de entrada para un puerto"
    Write-Host "7. Ejemplo If "
    Write-Host "8. Exit"
}

Function Conseguir-FirewallEstatus{
    [CmdletBinding()] Param([Parameter(Mandatory)] [ValidateSet("Public","Private")] [String] $perfil)
    Get-NetFirewallProfile -Name $perfil
    }

Function Cambiar-Estatus{    
    [CmdletBinding()] Param([Parameter(Mandatory)] [ValidateSet("Public","Private")] [String] $perfil,
    [Parameter(Mandatory)] [ValidateSet("True","False")] [String] $estatus)
    Set-NetFirewallProfile -Profile $perfil -Enabled $estatus
    }

Function Ver-NuestraRed{    
    Get-NetConnectionProfile
    }

Function Cambiar-Estatus{    
    [CmdletBinding()] Param([Parameter(Mandatory)] [ValidateSet("Public","Private")] [String] $perfil,
    [Parameter(Mandatory)] [String] $NombredeRed)
    Set-NetConnectionProfile -Name $NombredeRed -NetworkCategory $perfil
    }

Function Ver-ReglasBloqueo{
    Get-NetFirewallRule -Action Block -Enabled True
    }
Function Agregar-Bloqueo{    
    [CmdletBinding()] Param([Parameter(Mandatory)] [String] $Puerto,
    [Parameter(Mandatory)] [String] $NombredeRegla)
    New-NetFirewallRule -DisplayName $NombredeRegla -Profile @('Domain', 'Private') -Direction Inbound -Action Block -Protocol TCP -LocalPort @($Puerto)
    }

Function Eliminar-Bloqueo{    
    [CmdletBinding()] Param([Parameter(Mandatory)] [String] $NombredeRegla)
    Remove-NetFirewallRule -DisplayName $NombredeRegla
    }

Function Mostrar-EjemploIf{
    [CmdletBinding()] Param([Parameter(Mandatory)] [Int] $Numero)
    if ($Numero -gt 10) {
        Write-Host "El numero es mayor a 10"
    }
    else {
        Write-Host "El numero es menor a 10"
    }

}



showmenu
while(($inp = Read-Host -Prompt "Select an option") -ne "8")
{
switch($inp)
{
        1 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Ver el estatus de un perfil especi­fico en el Firewall"
            Write-Host "Las Opciones pueden ser Private/Public"
            Write-Host "------------------------------";
            Conseguir-FirewallEstatus
            pause;
            break
        }
        2 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Cambiar el estatus de los perfiles";
            Write-Host "Las Opciones pueden ser Private/Public"
            Write-Host "------------------------------";
            Cambiar-Estatus
            pause; 
            break
        }
        3 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Ver el perfil de nuestra red";
            Write-Host "------------------------------"; 
            Ver-NuestraRed
            pause;
            break
        }
        4 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Cambiar nuestra red a otro tipo de perfil";
            Write-Host "------------------------------"; 
            Cambiar-Estatus
            pause;
            break
        }
        5 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Ver las reglas de bloqueo";
            Write-Host "------------------------------"; 
            Ver-ReglasBloqueo
            pause;
            break
        }
        6 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Agregar regla de bloqueo de entrada para un puerto";
            Write-Host "------------------------------"; 
            Agregar-Bloqueo
            pause;
            break
        }
        7 {
            Clear-Host
            Write-Host "------------------------------";
            Write-Host "Ejemplo If"
            Write-Host "------------------------------"; 
            Mostrar-EjemploIf
            pause;
            break
        }

        8 {"Exit"; break}
        default {
        Write-Host -ForegroundColor red -BackgroundColor white "Invalid option. Please select another option";
        pause;
        }
        
    }
showmenu
}
