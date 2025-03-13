// document.addEventListener('DOMContentLoaded', function() {
//     const images = document.querySelectorAll('img[alt*="|"]');
    
//     images.forEach(img => {
//       const altParts = img.alt.split('|');
//       if (altParts.length > 1) {
//         const sizeParts = altParts[1].split('x');
//         img.alt = altParts[0];
        
//         if (sizeParts.length === 2) {
//           img.width = sizeParts[0];
//           img.height = sizeParts[1];
//         } else {
//           img.width = sizeParts[0];
//         }
//       }
//     });
//   });


document.addEventListener('DOMContentLoaded', function() {
  // 모든 이미지 요소 찾기
  const pTags = document.querySelectorAll('p');
  
  pTags.forEach(p => {
    // <p> 태그 내용이 이미지와 일치하는지 확인
    const imgElement = p.querySelector('img[alt*="|"]');
    if (imgElement) {
      try {
        const altText = imgElement.getAttribute('alt');
        const altParts = altText.split('|');
        
        if (altParts.length > 1) {
          // 실제 alt 텍스트만 남기기
          const newAlt = altParts[0];
          
          // 크기 정보 추출
          const sizeParts = altParts[1].split('x');
          let width, height;
          
          if (sizeParts.length === 2) {
            width = parseInt(sizeParts[0]);
            height = parseInt(sizeParts[1]);
          } else {
            width = parseInt(sizeParts[0]);
          }
          
          // 새 이미지 요소 생성
          const newImg = document.createElement('img');
          newImg.src = imgElement.src;
          newImg.alt = newAlt;
          
          if (width) newImg.width = width;
          if (height) newImg.height = height;
          
          // 원래 <p><img></p> 구조를 새 이미지로 대체
          p.parentNode.replaceChild(newImg, p);
          
          console.log('Image processed:', newImg);
        }
      } catch (error) {
        console.error('Error processing image:', error);
      }
    }
  });
  
  console.log('Image processing script executed');
});