document.addEventListener('DOMContentLoaded', function() {
    const images = document.querySelectorAll('img[alt*="|"]');
    
    images.forEach(img => {
      const altParts = img.alt.split('|');
      if (altParts.length > 1) {
        const sizeParts = altParts[1].split('x');
        img.alt = altParts[0];
        
        if (sizeParts.length === 2) {
          img.width = sizeParts[0];
          img.height = sizeParts[1];
        } else {
          img.width = sizeParts[0];
        }
      }
    });
  });