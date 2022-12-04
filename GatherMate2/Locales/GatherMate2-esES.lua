-- GatherMate Locale
-- Please use the Localization App on WoWAce to Update this
-- http://www.wowace.com/projects/gathermate2/localization

local L = LibStub("AceLocale-3.0"):NewLocale("GatherMate2", "esES")
if not L then return end

-- Options
L["Add this location to Cartographer_Waypoints"] = "Añadir esta localización a Cartographer_Waypoints"
L["Add this location to TomTom waypoints"] = "Añadir esta localización a los puntos de ruta de TomTom"
L["Always show"] = "Mostrar siempre"
L["Archaeology"] = "Arqueología"
L["Archaeology filter"] = "Filtro de arqueología"
L["Are you sure you want to delete all nodes from this database?"] = "¿Estás seguro que quieres borrar todos los nodos de esta base de datos?"
L["Are you sure you want to delete all of the selected node from the selected zone?"] = "¿Estás seguro que quieres borrar los nodos seleccionados de la zona elegida?"
L["Auto Import"] = "Autoimportar"
L["Auto import complete for addon "] = "Autoimportar completo para el Addon."
L["Automatically import when ever you update your data module, your current import choice will be used."] = "Importa automáticamente cuando actualizas el módulo de datos, se aplicarán las opciones actuales de importación."
L["Battle for Azeroth"] = "Battle for Azeroth"
L["Cataclysm"] = "Cataclysm"
L["Cleanup Complete."] = "Limpieza completada."
L["Cleanup Database"] = "Limpiar base de datos"
L["Cleanup Failed."] = "Falló la limpieza."
L["Cleanup in progress."] = "Limpieza en curso."
L["Cleanup radius"] = "Radio de limpieza"
L["Cleanup Started."] = "Limpieza iniciada."
L["Cleanup your database by removing duplicates. This takes a few moments, be patient."] = "Limpia la base de datos eliminando duplicados. Esto tomará un tiempo, sé paciente."
L["Cleanup_Desc"] = "Con el tiempo, tu base de datos puede verse sobrepoblada. Limpiar la base de datos implica buscar nodos de la misma profesión que están muy próximos y pueden ser colapsados en un único nodo."
L["CLEANUP_RADIUS_DESC"] = "El radio en yardas en el cual se eliminarán los nodos duplicados. Por defecto son |cffffd20050|r yardas para Extraer Gas y |cffffd20015|r yardas para los demás. Estas opciones también cuentan al añadir nodos."
L["Clear database selections"] = "Desmarca las bases de datos seleccionadas."
L["Clear node selections"] = "Desmarca los nodos seleccionados."
L["Clear zone selections"] = "Desmarca las zonas seleccionadas."
L["Click to toggle minimap icons."] = "Click para activar/desactivar los iconos del Minimapa."
L["Color of the tracking circle."] = "Color del circulo de rastreo."
L["Control various aspects of node icons on both the World Map and Minimap."] = "Controla varios aspectos de los iconos de los nodos tanto en el Mapa del mundo como en el Minimapa."
L["Conversion_Desc"] = "Conversion_desc convierte los datos existentes de GatherMate en formato GatherMate2."
L["Convert Databses"] = "Convertir bases de datos"
L["Database Locking"] = "Bloquear base de datos"
L["Database locking"] = "Bloquea la base de datos."
L["Database Maintenance"] = "Mantenimiento de la base de datos"
L["DATABASE_LOCKING_DESC"] = "El bloqueo de la base de datos permite congelar el estado de una base de datos. Una vez bloqueada no es posible añadir, borrar o modificar la base de datos. Esto incluye la limpieza y la importación."
L["Databases to Import"] = "Bases de datos a importar"
L["Databases you wish to import"] = "Las bases de datos que quieres importar."
L["Delete"] = "Borrar"
L["Delete Entire Database"] = "Borrar todo"
L["Delete selected node from selected zone"] = "Borra los nodos seleccionados de la zona escogida."
L["Delete Specific Nodes"] = "Borrar nodos"
L["DELETE_ENTIRE_DESC"] = "Esto ignorará el Bloquear base de datos y borrará todos los nodos de todas las zonas de la base de datos seleccionada."
L["DELETE_SPECIFIC_DESC"] = "Elimina todos los nodos seleccionados de la zona escogida. Debes desactivar Bloquear base de datos para que esto funcione."
L["Disabled"] = "Desactivado"
L["Display Settings"] = "Opciones de pantalla"
L["Enabled"] = "Activado"
L["Engineering"] = "Ingeniería"
L["Expansion"] = "Expansión"
L["Expansion Data Only"] = "Solo datos de la expansión."
L["Failed to load GatherMateData due to "] = "Fallo al cargar GatherMateData debido a "
L["FAQ"] = "FAQ"
L["FAQ_TEXT"] = [=[|cffffd200
Acabo de instalar GatherMate, pero no veo ningún nodo en mis mapas. ¿Qué hago mal?
|r
GatherMate no viene con datos por sí mismo. Cuando recoges hierbas, picas menas, recoges gas o pescas, GatherMate actualizará el mapa y marcará el nuevo recurso. Por si acaso, revisa tus opciones de pantalla.

|cffffd200
¡Veo nodos en el Mapa del mundo, pero no en el Minimapa! ¿Qué hago mal ahora?
|r
A |cffffff78Minimap Button Bag|r (y posiblemente a otros Addons) les gusta devorar todos los botones que se ponen el Minimapa. Desactívalos.

|cffffd200
¿Cómo o dónde puedo conseguir datos ya existentes?
|r
Puedes importar datos existentes en GatherMate de dos formas:

1. |cffffff78GatherMate_Data|r - Este Addon contiene toda la información recogida por Wowhead y se actualiza semanalmente. Hay opciones para autoactualizar.

2. |cffffff78GatherMate_CartImport|r - Este Addon permite importar tus bases de datos existentes en los módulos de |cffffff78Cartographer_<Profesión>|r a GatherMate. Para que esto funcione, necesitas tener activos a la vez tanto los módulos de |cffffff78Cartographer_<Profesión>|r como GatherMate_CartImport.

Ten en cuenta que importar datos en GatherMate no es un proceso automático. Debes ser tú quien entre en la sección de importar datos y pulse en el botón de "Importar".

Esto se diferencia de |cffffff78Cartographer_Data|r en que el usuario tiene la opción de cómo y cuándo quiere modificar los datos, |cffffff78Cartographer_Data|r cuando se carga simplemente sobrescribe los datos existentes en la base de datos actual de GatherMate por los importados sin dar ningún aviso.

|cffffd200
¿Pueden añadir soporte para mostrar la posición de cosas como los buzones y los maestros de vuelo?
|r
La respuesta es no. Sin embargo, otro autor de Addons puede crear uno o un módulo para ello. El núcleo de GatherMate no lo hará.

|cffffd200
¡He encontrado un fallo! ¿Dónde puedo informar de él?
|r
Puedes informar de bugs o enviar sugerencias a |cffffff78http://www.wowace.com/forums/index.php?topic=10990.0|r

También puedes encontrar a los autores en |cffffff78irc://irc.freenode.org/wowace|r

Cuando informes de un bug, asegúrate de incluir los |cffffff78pasos para poder reproducir el fallo|r, si es posible proporciona cualquier |cffffff78mensaje de error|r con datos adicionales (como los que proporciona buggrab). Informa también del |cffffff78número de revisión|r de GatherMate en el que se produce el problema e informa si estás utilizando el |cffffff78cliente Inglés u otro|r.

|cffffd200
¿Quién escribió este Addon tan increíble?
|r
Kagaro, Xinhuan, Nevcairiel y Ammo]=]
L["Filter_Desc"] = "Elige los tipos de nodo que deseas mostrar en el Mapa del mundo y en el Minimapa. Los nodos no seleccionados seguirán siendo registrados en la base de datos."
L["Filters"] = "Filtros"
L["Fish filter"] = "Filtrar bancos de pesca"
L["Fishes"] = "Bancos de pesca"
L["Fishing"] = "Pesca"
L["Frequently Asked Questions"] = "Preguntas frecuentes"
L["Gas Clouds"] = "Nubes de gas"
L["Gas filter"] = "Filtrar gas"
L["GatherMate Conversion"] = "Conversión de GatherMate"
L["GatherMate data has been imported."] = "Los datos de GatherMate han sido importados."
L["GatherMate Pin Options"] = "Opciones de pin de GatherMate"
L["GatherMate2Data has been imported."] = "GatherMate2Data ha sido importado."
L["GatherMateData has been imported."] = "Se ha importado GatherMateData."
L["General"] = "General"
L["Herb Bushes"] = "Hierbas"
L["Herb filter"] = "Filtrar hierbas"
L["Herbalism"] = "Herboristería"
L["Icon Alpha"] = "Transparencia de los iconos"
L["Icon alpha value, this lets you change the transparency of the icons. Only applies on World Map."] = "Valor de transparencia de los iconos. Sólo se aplica a los del Mapa del mundo."
L["Icon Scale"] = "Escala de iconos"
L["Icon scaling, this lets you enlarge or shrink your icons on both the World Map and Minimap."] = "Escala de iconos, esto le permite ampliar o reducir sus iconos tanto en el Mapa del mundo como en el Minimapa."
L["Icon scaling, this lets you enlarge or shrink your icons on the Minimap."] = "Escala de iconos, esto le permite ampliar o reducir sus iconos en el Minimapa."
L["Icon scaling, this lets you enlarge or shrink your icons on the World Map."] = "Escala de iconos, esto le permite ampliar o reducir sus iconos en el Mapa del mundo."
L["Icons"] = "Iconos"
L["Import Data"] = "Importar datos"
L["Import GatherMate2Data"] = "Importar GatherMate2Data"
L["Import GatherMateData"] = "Importar GatherMateData"
L["Import Options"] = "Opciones de importación"
L["Import Style"] = "Estilo de importación"
L["Importing_Desc"] = "Importar permite a GatherMate conseguir datos de nodos de otras fuentes además del propio juego. Tras importar datos, puedes necesitar realizar una limpieza de la base de datos."
L["Keybind to toggle Minimap Icons"] = "Definir tecla para activar/desactivar iconos en el Minimapa."
L["Keybind to toggle Worldmap Icons"] = "Definir tecla para activar/desactivar iconos en el Mapa del mundo."
L["Legion"] = "Legión"
L["Load GatherMate2Data and import the data to your database."] = "Carga GatherMate2Data e importa a tu base de datos."
L["Load GatherMateData and import the data to your database."] = "Carga GatherMateData e importa a tu base de datos."
L["Merge"] = "Fusionar"
L["Merge will add GatherMate2Data to your database. Overwrite will replace your database with the data in GatherMate2Data"] = "Fusionar agregará GatherMate2Data a tu base de datos. Sobrescribir sustituirá su base de datos con los datos de GatherMate2Data."
L["Merge will add GatherMateData to your database. Overwrite will replace your database with the data in GatherMateData"] = "Fusionar agregará GatherMateData a tu base de datos. Sobrescribir sustituirá su base de datos con los datos de GatherMateData."
L["Mine filter"] = "Filtrar minerales"
L["Mineral Veins"] = "Filones de mineral"
L["Minimap Icon Scale"] = "Iconos del Minimapa"
L["Minimap Icon Tooltips"] = "Info. en el Minimapa"
L["Minimap Icons"] = "Iconos del Minimapa"
L["Mining"] = "Minería"
L["Mists of Pandaria"] = "Mists of Pandaria"
L["Never show"] = "No mostrar nunca"
L["Only import selected expansion data from WoWDB"] = "Importa sólo datos de la expansión seleccionada de los datos de WoWDB."
L["Only import selected expansion data from WoWhead"] = " Importa sólo datos de la expansión seleccionada de los datos de Wowhead."
L["Only while tracking"] = "Sólo al rastrear"
L["Only with digsite"] = "Con sitios de excavación"
L["Only with profession"] = "Sólo al tener la profesión"
L["Overwrite"] = "Sobrescribir"
L["Processing "] = "Procesando "
L["Right-click for options."] = "Click derecho para ver las opciones."
L["Select All"] = "Seleccionar todo"
L["Select all databases"] = "Selecciona todas las bases de datos."
L["Select all nodes"] = "Selecciona todos los nodos."
L["Select all zones"] = "Selecciona todas las zonas."
L["Select Database"] = "Selecciona base de datos"
L["Select Databases"] = "Selecciona base de datos."
L["Select Node"] = "Selecciona nodo"
L["Select None"] = "No seleccionar nada"
L["Select the archaeology nodes you wish to display."] = "Selecciona los nodos de arqueología que deseas ver."
L["Select the fish nodes you wish to display."] = "Selecciona los nodos de pesca que deseas ver."
L["Select the gas clouds you wish to display."] = "Selecciona las nubes de gas que deseas ver."
L["Select the herb nodes you wish to display."] = "Selecciona los nodos de hierbas que deseas ver."
L["Select the mining nodes you wish to display."] = "Selecciona los nodos de minerales que deseas ver."
L["Select the treasure you wish to display."] = "Selecciona los nodos de tesoros que deseas ver."
L["Select Zone"] = "Selecciona zona"
L["Select Zones"] = "Selecciona zonas."
L["Selected databases are shown on both the World Map and Minimap."] = "Las bases de datos seleccionadas se mostrarán tanto en el Mapa del mundo como en el Minimapa."
L["Shadowlands"] = "Tierras Sombrías"
L["Shift-click to toggle world map icons."] = "Mayús-Click para activar/desactivar los iconos del Mapa del mundo."
L["Show Archaeology Nodes"] = "Mostrar nodos de arqueología"
L["Show Databases"] = "Mostrar bases de datos"
L["Show Fishing Nodes"] = "Mostrar nodos de pesca"
L["Show Gas Clouds"] = "Mostrar nubes de gas"
L["Show Herbalism Nodes"] = "Mostrar nodos de herboristería"
L["Show Minimap Icons"] = "Iconos en el Minimapa"
L["Show Mining Nodes"] = "Mostrar nodos de minería"
L["Show Nodes on Minimap Border"] = "Nodos en el borde"
L["Show Timber Nodes"] = "Mostrar nodos de Madera"
L["Show Tracking Circle"] = "Mostrar círculo de rastreo"
L["Show Treasure Nodes"] = "Mostrar nodos de tesoros"
L["Show World Map Icons"] = "Iconos en el Mapa"
L["Shows more Nodes that are currently out of range on the minimap's border."] = "Muestra nodos que están fuera de visión en el borde del Minimapa."
L["The Burning Crusades"] = "The Burning Crusades"
L["The distance in yards to a node before it turns into a tracking circle"] = "La distancia en yardas para que un nodo se convierta en un círculo de rastreo."
L["The Frozen Sea"] = "El Mar Gélido"
L["The North Sea"] = "El Mar del Norte"
L["Toggle if World Map icons are clickable (to remove them or generate way points)."] = "Cambiar si los iconos del mapa del mundo son cliqueables (para eliminarlos o generar puntos de ruta)."
L["Toggle showing archaeology nodes."] = "Activa/desactiva mostrar nodos de arqueología."
L["Toggle showing fishing nodes."] = "Activa/desactiva mostrar nodos de pesca."
L["Toggle showing gas clouds."] = "Activa/desactiva mostrar nubes de gas."
L["Toggle showing herbalism nodes."] = "Activa/desactiva mostrar nodos de herboristería."
L["Toggle showing Minimap icon tooltips."] = "Activa/desactiva mostrar información en los iconos del Minimapa."
L["Toggle showing Minimap icons."] = "Activa/desactiva mostrar iconos en el Minimapa."
L["Toggle showing mining nodes."] = "Activa/desactiva mostrar nodos de minería."
L["Toggle showing the tracking circle."] = "Activa/desactiva mostrar círculo de rastreo."
L["Toggle showing timber nodes."] = "Activa/desactiva mostrar nodos de Madera"
L["Toggle showing treasure nodes."] = "Activa/desactiva mostrar nodos de tesoros."
L["Toggle showing World Map icons."] = "Activa/desactiva mostrar iconos en el Mapa del mundo."
L["Tracking Circle Color"] = "Color del círculo de rastreo"
L["Tracking Distance"] = "Distancia de rastreo"
L["Treasure"] = "Tesoros"
L["Treasure filter"] = "Filtrar tesoros"
L["Warlords of Draenor"] = "Warlords of Draenor"
L["World Map Icon Scale"] = "Iconos del Mapa "
L["World Map Icons"] = "Iconos del Mapa del mundo"
L["World Map Icons Clickable"] = "Iconos del mapa del mundo cliqueables"
L["Wrath of the Lich King"] = "Wrath of the Lich King"


local NL = LibStub("AceLocale-3.0"):NewLocale("GatherMate2Nodes", "esES")
if not NL then return end

-- Nodes
NL["Abundant Bloodsail Wreckage"] = "Restos de los Velasangre abundantes"
NL["Abundant Firefin Snapper School"] = "Banco de Pargos de Fuego abundantes"
NL["Abundant Oily Blackmouth School"] = "Banco de Bocanegras Grasos abundantes"
NL["Abyssal Gulper School"] = "Banco de Anguila devoradora abisal"
NL["Adamantite Bound Chest"] = "Cofre reforzado con adamantita"
NL["Adamantite Deposit"] = "Depósito de adamantita"
NL["Adder's Tongue"] = "Lengua de víboris"
NL["Aethril"] = "Aethril"
NL["Akunda's Bite"] = "Mordisco de Akunda"
NL["Albino Cavefish School"] = "Banco de cavernosos albinos"
NL["Algaefin Rockfish School"] = "Banco de aletalgas de roca"
NL["Anchor Weed"] = "Alga de ancla"
NL["Ancient Lichen"] = "Liquen Antiguo"
NL["Ancient Mana Chunk"] = "Trozo de maná antiguo"
NL["Ancient Mana Crystal"] = "Cristal de maná antiguo"
NL["Ancient Mana Shard"] = "Fragmento de maná antiguo"
NL["Arakkoa Archaeology Find"] = "Hallazgo arqueológico de los arakkoa"
NL["Arcane Vortex"] = "Vórtice arcano"
NL["Arctic Cloud"] = "Nube ártica"
NL["Arthas' Tears"] = "Lágrimas de Arthas"
NL["Astral Glory"] = "Gloria astral"
NL["Azshara's Veil"] = "Velo de Azshara"
NL["Battered Chest"] = "Cofre maltrecho"
NL["Battered Footlocker"] = "Baúl maltrecho"
NL["Black Barracuda School"] = "Banco de barracudas negras"
NL["Black Lotus"] = "Loto negro"
NL["Black Trillium Deposit"] = "[Black Trillium Deposit]"
NL["Blackbelly Mudfish School"] = "Banco de pezfangos panzanegra"
NL["Blackrock Deposit"] = "Depósito de roca negra"
NL["Blackwater Whiptail School"] = "Banco de Bagre de Aguasnegras"
NL["Blind Lake Sturgeon School"] = "Banco de Esturión ciego de lago"
NL["Blindweed"] = "Carolina"
NL["Blood of Heroes"] = "[Blood of Heroes]"
NL["Bloodpetal Sprout"] = "Brote pétalo de sangre"
NL["Bloodsail Wreckage"] = "Restos de los Velasangre"
NL["Bloodsail Wreckage Pool"] = "Banco de Restos de los Velasangre"
NL["Bloodthistle"] = "Cardo de sangre"
NL["Bloodvine"] = "Vid de sangre"
NL["Bluefish School"] = "Banco de pezazules"
NL["Borean Man O' War School"] = "Banco de carabelas boreales"
NL["Bound Adamantite Chest"] = "Cofre reforzado con adamantita"
NL["Bound Fel Iron Chest"] = "Cofre reforzado con hierro vil"
NL["Brackish Mixed School"] = "Banco mixto salobre"
NL["Briarthorn"] = "Brezospina"
NL["Brightly Colored Egg"] = "Huevo de Colores Vivos"
NL["Bruiseweed"] = "Hierba cardenal"
NL["Buccaneer's Strongbox"] = "Caja fuerte de bucanero"
NL["Burial Chest"] = "Sarcófago"
NL["Cinder Cloud"] = "Nube de ceniza"
NL["Cinderbloom"] = "Flor de ceniza"
NL["Cobalt Deposit"] = "Depósito de cobalto"
NL["Copper Vein"] = "Filón de cobre"
NL["Cursed Queenfish School"] = "Banco de peces reina malditos"
NL["Dark Iron Deposit"] = "Depósito de Hierro negro"
NL["Dark Iron Treasure Chest"] = "Arqueta Hierro Negro"
NL["Dark Soil"] = "Tierra oscura"
NL["Dart's Nest"] = "Nido de Dardo"
NL["Death Blossom"] = "Estrella mortal"
NL["Deep Sea Monsterbelly School"] = "Banco de tripayuyus de las profundidades"
NL["Deepsea Sagefish School"] = "Banco de peces sabiola marfunda"
NL["Demonic Archaeology Find"] = "Hallazgo arqueológico demoníaco"
NL["Dented Footlocker"] = "Baúl abollado"
NL["Draenei Archaeology Find"] = "Hallazgo arqueológico de los draenei"
NL["Draenor Clans Archaeology Find"] = "Hallazgo arqueológico de los clanes de Draenor"
NL["Dragonfin Angelfish School"] = "Banco de peces ángel aletadragón"
NL["Dragon's Teeth"] = "Dientes de dragón"
NL["Dreamfoil"] = "Hojasueño"
NL["Dreaming Glory"] = "Gloria de ensueño"
NL["Dreamleaf"] = "Frondasueño"
NL["Drust Archaeology Find"] = "Hallazgo arqueológico de los Drust"
NL["Dwarf Archaeology Find"] = "Hallazgo arqueológico de los enanos"
NL["Earthroot"] = "Raíz de tierra"
NL["Elementium Vein"] = "Filón de elementium"
NL["Elethium Deposit"] = "Depósito de eletio"
NL["Elusive First Flower"] = "Primera flor esquiva"
NL["Elysian Thade School"] = "Banco de thades elisios"
NL["Emperor Salmon School"] = "Banco de salmones emperador"
NL["Empyrium Deposit"] = "Depósito de empirium"
NL["Empyrium Seam"] = "Veta de empirium"
NL["Everfrost Chip"] = "Esquirla de siemprescarcha"
NL["Fadeleaf"] = "Pálida"
NL["Fangtooth Herring School"] = "Banco de arenques colmillo"
NL["Fat Sleeper School"] = "Banco de Coto gordo"
NL["Fathom Eel Swarm"] = "Banco de anguilas de las profundidades"
NL["Fel Iron Chest"] = "Cofre de hierro vil"
NL["Fel Iron Deposit"] = "Depósito de hierro vil"
NL["Fel-Encrusted Herb"] = "Hierba con costra vil"
NL["Fel-Encrusted Herb Cluster"] = "Manojo de hierba con costra vil"
NL["Felmist"] = "Bruma Vil"
NL["Felmouth Frenzy School"] = "Banco de frenesís bocaviles"
NL["Felslate Deposit"] = "Depósito de pizarra vil"
NL["Felslate Seam"] = "Veta de pizarra vil"
NL["Felsteel Chest"] = "Cofre de acero vil"
NL["Feltail School"] = "Banco de colaviles"
NL["Felweed"] = "Hierba vil"
NL["Felwort"] = "Matojo vil"
NL["Fever of Stormrays"] = "Fiebre de las rayatormentas"
NL["Fire Ammonite School"] = "Banco de Amonites de fuego"
NL["Firebloom"] = "Flor de fuego"
NL["Firefin Snapper School"] = "Banco de pargos de fuego"
NL["Firethorn"] = "Espino de fuego"
NL["Fireweed"] = "Adelfilla"
NL["First Flower"] = "Primera flor"
NL["Fjarnskaggl"] = "Fjarnskaggl"
NL["Flame Cap"] = "Seta flamígera"
NL["Floating Debris"] = "Restos flotando"
NL["Floating Debris Pool"] = "Banco de Restos flotando"
NL["Floating Shipwreck Debris"] = "[Floating Shipwreck Debris]"
NL["Floating Wreckage"] = "Restos de un naufragio"
NL["Floating Wreckage Pool"] = "Banco de Restos de un naufragio"
NL["Fool's Cap"] = "Seta del inocente"
NL["Fossil Archaeology Find"] = "Hallazgo arqueológico fósil"
NL["Foxflower"] = "Flor de raposa"
NL["Frenzied Fangtooth School"] = "Banco de peces colmillo demenciados"
NL["Frost Lotus"] = "Loto de escarcha"
NL["Frostweed"] = "Verbesina"
NL["Frozen Herb"] = "Hierba congelada"
NL["Ghost Iron Deposit"] = "Depósito de hierro fantasma"
NL["Ghost Mushroom"] = "Champiñón fantasma"
NL["Giant Clam"] = "Almeja gigante"
NL["Giant Mantis Shrimp Swarm"] = "Enjambre de gambas mantis gigantes"
NL["Glacial Salmon School"] = "Banco de salmones glaciales"
NL["Glassfin Minnow School"] = "Banco de pezqueñines aletacristal"
NL["Gleaming Draenic Chest"] = "Cofre draénico resplandeciente"
NL["Glimmering Chest"] = "Cofre brillante"
NL["Glowcap"] = "Fluochampiñón"
NL["Glowing Tome"] = "Tomo resplandeciente"
NL["Gold Vein"] = "Filón de oro"
NL["Goldclover"] = "Trébol de oro"
NL["Golden Carp School"] = "[Golden Carp School]"
NL["Golden Lotus"] = "Loto dorado"
NL["Golden Sansam"] = "Sansam dorado"
NL["Goldthorn"] = "Espina de oro"
NL["Gorgrond Flytrap"] = "Atrapamoscas de Gorgrond"
NL["Grave Moss"] = "Musgo de tumba"
NL["Great Sea Catfish School"] = "Banco de grandes siluros de mar"
NL["Greater Sagefish School"] = "Banco de sabiolas superior"
NL["Green Tea Leaf"] = "Hoja de té verde"
NL["Gromsblood"] = "Gromsanguina"
NL["Heartblossom"] = "Flor de corazón"
NL["Heavy Fel Iron Chest"] = "Cofre pesado de hierro vil"
NL["Highborne Archaeology Find"] = "Hallazgo arqueológico de los Altonato"
NL["Highland Guppy School"] = "Banco de lebistes de las Tierras Altas"
NL["Highland Mixed School"] = "Banco mixto de las Tierras Altas"
NL["Highmaul Reliquary"] = "Relicario de Ogrópolis"
NL["Highmountain Salmon School"] = "Banco de salmones de Monte Alto"
NL["Highmountain Tauren Archaeology Find"] = "Hallazgo arqueológico de los tauren Monte Alto"
NL["Huge Obsidian Slab"] = "[Huge Obsidian Slab]"
NL["Icecap"] = "Setelo"
NL["Icethorn"] = "Espina de hielo"
NL["Imperial Manta Ray School"] = "Banco de mantas raya imperiales"
NL["Incendicite Mineral Vein"] = "Filón de mineral de incendicita"
NL["Indurium Mineral Vein"] = "Filón de mineral de indurio"
NL["Ionized Minnows"] = "Pececillos ionizados"
NL["Iridescent Amberjack School"] = "Banco de serviolas iridiscentes"
NL["Iron Deposit"] = "Depósito de hierro"
NL["Jade Lungfish School"] = "Banco de peces alveolares de jade"
NL["Jawless Skulker School"] = "Banco de Vagador mermaquija"
NL["Jelly Deposit"] = "Depósito de jalea"
NL["Jewel Danio School"] = "Banco de danios enjoyados"
NL["Khadgar's Whisker"] = "Mostacho de Khadgar"
NL["Khorium Vein"] = "Filón de korio"
NL["Kingsblood"] = "Sangrerregia"
NL["Krasarang Paddlefish School"] = "Banco de poliodóntidos de Krasarang"
NL["Kyparite Deposit"] = "Depósito de kyparita"
NL["Laestrite Deposit"] = "Depósito de laestrita"
NL["Lagoon Pool"] = "Poza de laguna"
NL["Lane Snapper School"] = "Banco de biajaibas"
NL["Large Battered Chest"] = "Cofre maltrecho grande"
NL["Large Darkwood Chest"] = "Cofre grande de Leñoscuro"
NL["Large Iron Bound Chest"] = "Cofre reforzado con hierro grande"
NL["Large Jelly Deposit"] = "Depósito de jalea grande"
NL["Large Mithril Bound Chest"] = "Cofre reforzado con mitril grande"
NL["Large Obsidian Chunk"] = "Trozo de obsidiana grande"
NL["Large Solid Chest"] = "Cofre macizo grande"
NL["Large Timber"] = "Madera grande"
NL["Lesser Bloodstone Deposit"] = "Depósito de sangrita inferior"
NL["Lesser Firefin Snapper School"] = "[Lesser Firefin Snapper School]"
NL["Lesser Floating Debris"] = "[Lesser Floating Debris]"
NL["Lesser Oily Blackmouth School"] = "[Lesser Oily Blackmouth School]"
NL["Lesser Sagefish School"] = "[Lesser Sagefish School]"
NL["Leypetal Blossom"] = "Flor de pétalo Ley"
NL["Leypetal Powder"] = "Polvo de pétalo Ley"
NL["Leystone Deposit"] = "Depósito de piedra Ley"
NL["Leystone Seam"] = "Veta de piedra Ley"
NL["Lichbloom"] = "Flor exánime"
NL["Liferoot"] = "Vidarraíz"
NL["Lost Sole School"] = "Banco de lenguados perdidos"
NL["Lumber Mill"] = "Aserradero"
NL["Lush Elusive First Flower"] = "Primera flor esquiva exuberante"
NL["Lush First Flower"] = "Primera flor exuberante"
NL["Lush Nightshade"] = "Sombranoche exuberante"
NL["Mageroyal"] = "Marregal"
NL["Mana Thistle"] = "Cardo de maná"
NL["Mana-Infused Gem"] = "Gema imbuida de maná"
NL["Mantid Archaeology Find"] = "Hallazgo arqueológico mántide"
NL["Maplewood Treasure Chest"] = "Arqueta de madera de arce"
NL["Marrowroot"] = "Raizmédula"
NL["Mauve Stinger School"] = "Banco de aguijoneros malva"
NL["Mechanized Chest"] = "Cofre mecanizado"
NL["Mithril Deposit"] = "Depósito de mitril"
NL["Mixed Ocean School"] = "Banco de mezcla oceánica"
NL["Mogu Archaeology Find"] = "Hallazgo arqueológico mogu"
NL["Monelite Deposit"] = "Depósito de monelita"
NL["Monelite Seam"] = "Veta de monelita"
NL["Moonglow Cuttlefish School"] = "Banco de sepias resplandor lunar"
NL["Mossgill Perch School"] = "Cardumen de percas branquiamusgo"
NL["Mossy Footlocker"] = "Baúl mohoso"
NL["Mountain Silversage"] = "Salviargenta de montaña"
NL["Mountain Trout School"] = "Banco de truchas de montaña"
NL["Muddy Churning Water"] = "[Muddy Churning Water]"
NL["Mudfish School"] = "Banco de peces barro"
NL["Musselback Sculpin School"] = "Banco de peces escorpión mejillón"
NL["Mysterious Camel Figurine"] = "Figurilla de camello misteriosa"
NL["Nagrand Arrowbloom"] = "Saeta de Nagrand"
NL["Nerubian Archaeology Find"] = "Hallazgo arqueológico nerubiano"
NL["Netherbloom"] = "Flor abisal"
NL["Nethercite Deposit"] = "Depósito de abisalita"
NL["Netherdust Bush"] = "Arbusto de polvo abisal"
NL["Netherwing Egg"] = "Huevo de Ala Abisal"
NL["Nettlefish School"] = "Banco de medusas"
NL["Night Elf Archaeology Find"] = "Hallazgo arqueológico de los elfos de la noche"
NL["Nightmare Vine"] = "Vid pesadilla"
NL["Nightshade"] = "Sombranoche"
NL["Obsidian Chunk"] = "Restos Obsidiana"
NL["Obsidium Deposit"] = "Depósito de obsidium"
NL["Ogre Archaeology Find"] = "Hallazgo arqueológico de los ogros"
NL["Oil Spill"] = "Vertido de petróleo"
NL["Oily Abyssal Gulper School"] = "Banco aceitoso de Anguila devoradora abisal"
NL["Oily Blackmouth School"] = "Banco de bocanegras grasos"
NL["Oily Sea Scorpion School"] = "Banco aceitoso de Escorpina"
NL["Onyx Egg"] = "Huevo de ónice"
NL["Ooze Covered Gold Vein"] = "Filón de oro cubierto de moco"
NL["Ooze Covered Mithril Deposit"] = "Filón de mitril cubierto de moco"
NL["Ooze Covered Rich Thorium Vein"] = "Filón de torio enriquecido cubierto de moco"
NL["Ooze Covered Silver Vein"] = "Filón de plata cubierto de moco"
NL["Ooze Covered Thorium Vein"] = "Filón de torio cubierto de moco"
NL["Ooze Covered Truesilver Deposit"] = "Filón de veraplata cubierta de moco"
NL["Orc Archaeology Find"] = "Hallazgo arqueológico de los orcos"
NL["Osmenite Deposit"] = "Depósito de osmenita"
NL["Osmenite Seam"] = "Veta de osmenita"
NL["Other Archaeology Find"] = "Otros Hallazgos de Arqueologia"
NL["Oxxein Deposit"] = "Depósito de oxxeína"
NL["Pandaren Archaeology Find"] = "Hallazgo arqueológico pandaren"
NL["Patch of Elemental Water"] = "[Patch of Elemental Water]"
NL["Peacebloom"] = "Flor de paz"
NL["Phaedrum Deposit"] = "Depósito de faedro"
NL["Plaguebloom"] = "Flor de peste"
NL["Platinum Deposit"] = "Depósito de platino"
NL["Pocked Bonefish School"] = "Banco de macabijos marcados"
NL["Pool of Fire"] = "Piscina de fuego"
NL["Practice Lockbox"] = "Arcón de prácticas"
NL["Primitive Chest"] = "Cofre primitivo"
NL["Prismatic Crystal"] = "Cristal prismático"
NL["Pure Saronite Deposit"] = "Deposito de Saronita Puro"
NL["Pure Water"] = "Agua pura"
NL["Purple Lotus"] = "Loto cárdeno"
NL["Pyrite Deposit"] = "Depósito de pirita"
NL["Radiating Apexis Shard"] = "Fragmento apexis radiante"
NL["Ragveil"] = "Velada"
NL["Rain Poppy"] = "Amapola de lluvia"
NL["Rasboralus School"] = "Banco de rasboralus"
NL["Ravasaur Matriarch's Nest"] = "Nido de matriarca ravasaurio"
NL["Razormaw Matriarch's Nest"] = "Nido de matriarca Tajobuche"
NL["Redbelly Mandarin School"] = "Banco de mandarines panzarroja"
NL["Redtail Loach School"] = "Banco de lochas colarroja"
NL["Reef Octopus Swarm"] = "Banco de pulpos de arrecife"
NL["Rich Adamantite Deposit"] = "Depósito rico en adamantita"
NL["Rich Blackrock Deposit"] = "Depósito rico en roca negra"
NL["Rich Cobalt Deposit"] = "Depósito de cobalto rico"
NL["Rich Elementium Vein"] = "Filón de elementium rico"
NL["Rich Elethium Deposit"] = "Depósito rico en eletio"
NL["Rich Empyrium Deposit"] = "Depósito rico en empirium"
NL["Rich Felslate Deposit"] = "Depósito rico en pizarra vil"
NL["Rich Ghost Iron Deposit"] = "Depósito de hierro fantasma rico"
NL["Rich Kyparite Deposit"] = "Depósito de kyparita rico"
NL["Rich Laestrite Deposit"] = "Depósito rico en laestrita"
NL["Rich Leystone Deposit"] = "Depósito rico en piedra Ley"
NL["Rich Monelite Deposit"] = "Depósito de monelita rico"
NL["Rich Obsidium Deposit"] = "Depósito de obsidium rico"
NL["Rich Osmenite Deposit"] = "Depósito de osmenita rico"
NL["Rich Oxxein Deposit"] = "Depósito rico en oxxeína"
NL["Rich Phaedrum Deposit"] = "Depósito rico en faedro"
NL["Rich Platinum Deposit"] = "Depósito de platino rico"
NL["Rich Pyrite Deposit"] = "Depósito de pirita rico"
NL["Rich Saronite Deposit"] = "Depósito de saronita rico"
NL["Rich Sinvyr Deposit"] = "Depósito rico en sinvyr"
NL["Rich Solenium Deposit"] = "Depósito rico en solenio"
NL["Rich Storm Silver Deposit"] = "Depósito de plata de tormenta rico"
NL["Rich Thorium Vein"] = "Filón de torio enriquecido"
NL["Rich Trillium Vein"] = "Filón de trillium enriquecido"
NL["Rich True Iron Deposit"] = "Depósito rico en verahierro"
NL["Rising Glory"] = "Gloria creciente"
NL["Riverbud"] = "Brotarrío"
NL["Runescale Koi School"] = "Banco de koi de escamas rúnicas"
NL["Runestone Treasure Chest"] = "Arqueta de piedras rúnicas"
NL["Sagefish School"] = "Banco de sabiolas"
NL["Sand Shifter School"] = "Banco de recorrearenas"
NL["Saronite Deposit"] = "Depósito de saronita"
NL["Savage Piranha Pool"] = "Banco de Pirañas salvajes"
NL["Scarlet Footlocker"] = "Baúl Escarlata"
NL["School of Darter"] = "Banco de dardos"
NL["School of Deviate Fish"] = "Banco de peces descarriados"
NL["School of Tastyfish"] = "Banco de pezricos"
NL["Schooner Wreckage"] = "Restos de goleta"
NL["Schooner Wreckage Pool"] = "Banco de Restos de goleta"
NL["Sea Scorpion School"] = "Banco de Escorpina"
NL["Sea Stalks"] = "Tallomares"
NL["Sentry Fish School"] = "Banco de peces centinela"
NL["Sha-Touched Herb"] = "Hierba influenciada por el sha"
NL["Shipwreck Debris"] = "Restos de naufragio"
NL["Silken Treasure Chest"] = "Arqueta de seda"
NL["Silkweed"] = "Hierbaseda"
NL["Silver Vein"] = "Filón de plata"
NL["Silverbound Treasure Chest"] = "Arqueta reforzada con plata"
NL["Silvergill Pike School"] = "Banco de lucios platabranquias"
NL["Silverleaf"] = "Hojaplata"
NL["Sinvyr Deposit"] = "Depósito de sinvyr"
NL["Siren's Sting"] = "Picadura de sirena"
NL["Slimy Mackerel School"] = "Banco de caballas babosas"
NL["Small Obsidian Chunk"] = "Pequeño fragmento de obsidiana"
NL["Small Thorium Vein"] = "Filón pequeño de torio"
NL["Small Timber"] = "Madera pequeña"
NL["Snow Lily"] = "Lirio de las nieves"
NL["Solenium Deposit"] = "Depósito de solenio"
NL["Solid Chest"] = "Cofre macizo"
NL["Solid Fel Iron Chest"] = "Cofre sólido de hierro vil"
NL["Sorrowmoss"] = "Musgopena"
NL["Sparkling Pool"] = "Poza brillante"
NL["Sparse Firefin Snapper School"] = "[Sparse Firefin Snapper School]"
NL["Sparse Oily Blackmouth School"] = "[Sparse Oily Blackmouth School]"
NL["Sparse Schooner Wreckage"] = "[Sparse Schooner Wreckage]"
NL["Spinefin Piranha School"] = "Banco de pirañas espinosas"
NL["Spinefish School"] = "Banco de peces espinosos"
NL["Sporefish School"] = "Banco de pecesporas"
NL["Star Moss"] = "Musgo estelar"
NL["Starflower"] = "Estelaria"
NL["Starlight Rose"] = "Rosa luz estelar"
NL["Steam Cloud"] = "Nube de vapor"
NL["Steam Pump Flotsam"] = "Restos flotantes de bomba de vapor"
NL["Stonescale Eel Swarm"] = "Banco de anguilas escama pétrea"
NL["Storm Silver Deposit"] = "Depósito de plata de tormenta"
NL["Storm Silver Seam"] = "Veta de plata de tormenta"
NL["Stormvine"] = "Viñaviento"
NL["Strange Pool"] = "Banco extraño"
NL["Stranglekelp"] = "Alga estranguladora"
NL["Sturdy Treasure Chest"] = "Arqueta robusta"
NL["Sungrass"] = "Solea"
NL["Suspiciously Glowing Chest"] = "Cofre sospechosamente resplandeciente"
NL["Swamp Gas"] = "Gas de pantano"
NL["Takk's Nest"] = "Nido de Takk"
NL["Talador Orchid"] = "Orquídea de Talador"
NL["Talandra's Rose"] = "Rosa de Talandra"
NL["Tattered Chest"] = "Cofre ajado"
NL["Teeming Firefin Snapper School"] = "Banco de pargos de fuego abundante"
NL["Teeming Floating Wreckage"] = "[Teeming Floating Wreckage]"
NL["Teeming Oily Blackmouth School"] = "Banco de bocanegras grasos abundante"
NL["Terocone"] = "Teropiña"
NL["Tiger Gourami School"] = "Banco de guramis tigre"
NL["Tiger Lily"] = "Lirio atigrado"
NL["Timber"] = "Madera"
NL["Tin Vein"] = "Filón de estaño"
NL["Tiragarde Perch School"] = "Banco de percas de Tirigarde"
NL["Titanium Vein"] = "Filón de titanio"
NL["Tol'vir Archaeology Find"] = "Hallazgo arqueológico de los Tol'vir"
NL["Trillium Vein"] = "Filón de trillium"
NL["Troll Archaeology Find"] = "Hallazgo arqueológico de los trols"
NL["Trove of the Thunder King"] = "Tesoro del Rey del Trueno"
NL["True Iron Deposit"] = "Depósito de verahierro"
NL["Truesilver Deposit"] = "Depósito de veraplata"
NL["Twice-Fortified Arcwine"] = "Vino de arco doble"
NL["Twilight Jasmine"] = "Jazmín Crepuscular"
NL["Un'Goro Dirt Pile"] = "Montón de porquería de Un'Goro"
NL["U'taka School"] = "Banco de u'takas"
NL["Vigil's Torch"] = "Antorcha de vigilia"
NL["Viper Fish School"] = "Banco de peces víbora"
NL["Vrykul Archaeology Find"] = "Hallazgo arqueológico de los vrykuls"
NL["Waterlogged Footlocker"] = "Baúl con marcas de agua"
NL["Waterlogged Wreckage"] = "Restos con marcas de agua"
NL["Waterlogged Wreckage Pool"] = "Banco de Restos encharcados"
NL["Whiptail"] = "Colátigo"
NL["White Trillium Deposit"] = "[White Trillium Deposit]"
NL["Wicker Chest"] = "Cofre de mimbre"
NL["Widowbloom"] = "Flor de viuda"
NL["Wild Steelbloom"] = "Acérita salvaje"
NL["Windy Cloud"] = "Nube ventosa"
NL["Winter's Kiss"] = "Beso gélido"
NL["Wintersbite"] = "Ivernalia"
NL["Withered Herb"] = "Hierba marchita"
NL["Zandalari Archaeology Find"] = "Hallazgo arqueológico Zandalari"
NL["Zin'anthid"] = "Zin'anthid"

