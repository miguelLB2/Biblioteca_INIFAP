import React, { useState, useEffect } from 'react';
import { StyleSheet, Text, View, FlatList, TouchableOpacity, Linking, SafeAreaView } from 'react-native';

export default function App() {
  const [folletos, setFolletos] = useState([]);
  const [cargando, setCargando] = useState(true);

  // Cambia esto a la IP de tu computadora (ej: 192.168.1.75) cuando pruebes en tu celular real
  const URL_BACKEND = 'http://192.168.1.75:3000'; 

  useEffect(() => {
    // Usamos fetch nativo (JavaScript puro) para traer los folletos
    fetch(`${URL_BACKEND}/api/folletos`)
      .then(respuesta => respuesta.json())
      .then(datos => {
        setFolletos(datos);
        setCargando(false);
      })
      .catch(error => {
        console.error("Error al traer los folletos:", error);
        setCargando(false);
      });
  }, []);

  const abrirFolleto = (urlParcial) => {
    const urlCompleta = `${URL_BACKEND}${urlParcial}`;
    Linking.openURL(urlCompleta).catch(err => console.error("No se pudo abrir el PDF", err));
  };

  return (
    <SafeAreaView style={styles.contenedor}>
      <View style={styles.encabezado}>
        <Text style={styles.tituloApp}>Catálogo INIFAP</Text>
        <Text style={styles.subtituloApp}>Folletos e Investigaciones</Text>
      </View>

      {cargando ? (
        <Text style={styles.textoCargando}>Cargando folletos...</Text>
      ) : (
        <FlatList
          data={folletos}
          keyExtractor={(item) => item.id.toString()}
          contentContainerStyle={styles.lista}
          renderItem={({ item }) => (
            <View style={styles.tarjeta}>
              <View style={styles.tarjetaCabecera}>
                <Text style={styles.etiquetaCategoria}>{item.categoria_nombre}</Text>
              </View>
              
              <Text style={styles.tituloFolleto}>{item.titulo}</Text>
              <Text style={styles.autorFolleto}>Por: {item.autor} ({item.anio_publicacion})</Text>

              <TouchableOpacity 
                style={styles.boton}
                onPress={() => abrirFolleto(item.pdf_url)}
              >
                <Text style={styles.textoBoton}>Ver PDF</Text>
              </TouchableOpacity>
            </View>
          )}
        />
      )}
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  contenedor: { 
    flex: 1, 
    backgroundColor: '#f5f5f5' 
  },
  encabezado: {
    backgroundColor: '#004d40',
    padding: 24,
    paddingTop: 60,
  },
  tituloApp: { 
    fontSize: 24, 
    fontWeight: 'bold', 
    color: 'white' 
  },
  subtituloApp: { 
    fontSize: 16, 
    color: '#e0f2f1', 
    marginTop: 4 
  },
  textoCargando: {
    textAlign: 'center',
    marginTop: 50,
    fontSize: 18,
    color: '#555'
  },
  lista: { 
    padding: 16 
  },
  tarjeta: {
    backgroundColor: 'white',
    borderRadius: 8,
    padding: 16,
    marginBottom: 16,
    elevation: 3, // Sombra en Android
  },
  tarjetaCabecera: { 
    flexDirection: 'row', 
    marginBottom: 8 
  },
  etiquetaCategoria: {
    backgroundColor: '#e8f5e9',
    color: '#2e7d32',
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 4,
    fontSize: 12,
    fontWeight: 'bold',
    overflow: 'hidden'
  },
  tituloFolleto: { 
    fontSize: 18, 
    fontWeight: 'bold', 
    color: '#333', 
    marginBottom: 4 
  },
  autorFolleto: {
    fontSize: 14,
    color: '#666',
    marginBottom: 16
  },
  boton: {
    backgroundColor: '#004d40',
    padding: 12,
    borderRadius: 6,
    alignItems: 'center'
  },
  textoBoton: { 
    color: 'white', 
    fontWeight: 'bold', 
    fontSize: 16 
  }
});
